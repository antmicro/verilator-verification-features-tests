function removeJavaScriptDisabledWarning() {
    // Not using jQuery here for maximum speed
    document.getElementById('javascript-disabled').style.display = 'none';
}

function addJavaScriptDisabledWarning(error) {
    if (window.console)
        console.error('Opening failed: ' + error.name + ': ' + error.message);
    document.getElementById('javascript-disabled').style.display = 'block';
}

function initLayout(suiteName, type) {
    parseTemplates();
    setTitle(suiteName, type);
    addHeader();
    addReportOrLogLink(type);
}

function parseTemplates() {
    $('script[type="text/x-jquery-tmpl"]').map(function (idx, elem) {
        $.template(elem.id, elem.text);
    });
}

function testOrTask(text) {
    return text.replace(/{(.*)}/, function (match, group, offset, string) {
        if (!window.settings.rpa)
            return group;
        return {'TEST': 'TASK', 'Test': 'Task', 'test': 'task'}[group];
    });
}

function setTitle(suiteName, type) {
    var givenTitle = window.settings.title;
    var title = givenTitle ? givenTitle : suiteName + " " + type;
    document.title = util.unescape(title);
}

function addHeader() {
    var generated = util.timestamp(window.output.generated);
    $.tmpl('<h1>${title}</h1>' +
           '<div id="generated">' +
             '<span>Generated<br>${generated}</span><br>' +
             '<span id="generated-ago">${ago} ago</span>' +
           '</div>' +
           '<div id="top-right-header">' +
             '<div id="report-or-log-link"><a href="#"></a></div>' +
           '</div>', {
        generated: util.createGeneratedString(generated),
        ago: util.createGeneratedAgoString(generated),
        title: document.title
    }).appendTo($('#header'));
}

function addReportOrLogLink(myType) {
    var url;
    var text;
    var container = $('#report-or-log-link');
    if (myType == 'Report') {
        url = window.settings.logURL;
        text = 'LOG';
    } else {
        url = window.settings.reportURL;
        text = 'REPORT';
    }
    if (url) {
        container.find('a').attr('href', url);
        container.find('a').text(text);
    } else {
        container.remove();
    }
}

function addStatistics() {
    var statHeaders =
        '<th class="stats-col-stat">Total</th>' +
        '<th class="stats-col-stat">Pass</th>' +
        '<th class="stats-col-stat">Fail</th>' +
        '<th class="stats-col-stat">Skip</th>' +
        '<th class="stats-col-elapsed">Elapsed</th>' +
        '<th class="stats-col-graph">Pass / Fail / Skip</th>' +
        '<th class="stats-col-stat"">Info</th>';
    var statTable =
        '<h2>{Test} Statistics</h2>' +
        '<table class="statistics" id="total-stats"><thead><tr>' +
        '<th class="stats-col-name">Total Statistics</th>' + statHeaders +
        '</tr></thead></table>' +
        '<table class="statistics" id="tag-stats"><thead><tr>' +
        '<th class="stats-col-name">Statistics by Tag</th>' + statHeaders +
        '</tr></thead></table>' +
        '<table class="statistics" id="suite-stats"><thead><tr>' +
        '<th class="stats-col-name">Statistics by Suite</th>' + statHeaders +
        '</tr></thead></table>';
    $(testOrTask(statTable)).appendTo('#statistics-container');
    util.map(['total', 'tag', 'suite'], addStatTable);
    addTooltipsToElapsedTimes();
    enableStatisticsSorter();
}

function addTooltipsToElapsedTimes() {
    $('.stats-col-elapsed').attr('title',
        testOrTask('Total execution time of these {test}s. ') +
        'Excludes suite setups and teardowns.');
    $('#suite-stats').find('.stats-col-elapsed').attr('title',
        'Total execution time of this suite.');
}

function enableStatisticsSorter() {
    $.tablesorter.addParser({
        id: 'statName',
        type: 'numeric',
        is: function(s) {
            return false;  // do not auto-detect
        },
        format: function(string, table, cell, cellIndex) {
            // Rows have class in format 'row-<index>'.
            var index = $(cell).parent().attr('class').substring(4);
            return parseInt(index);
        }
    });
    $(".statistics").tablesorter({
        sortInitialOrder: 'desc',
        headers: {0: {sorter: 'statName', sortInitialOrder: 'asc'},
                  6: {sorter: false}}
    });
}

function addStatTable(tableName) {
    var stats = window.testdata.statistics()[tableName];
    if (tableName == 'tag' && stats.length == 0) {
        renderNoTagStatTable();
    } else {
        renderStatTable(tableName, stats);
    }
}

function renderNoTagStatTable() {
    $('<tbody><tr class="row-0">' +
        '<td class="stats-col-name">No Tags</td>' +
        '<td class="stats-col-stat"></td>' +
        '<td class="stats-col-stat"></td>' +
        '<td class="stats-col-stat"></td>' +
        '<td class="stats-col-stat"></td>' +
        '<td class="stats-col-elapsed"></td>' +
        '<td class="stats-col-graph">' +
          '<div class="empty-graph"></div>' +
        '</td>' +
      '</tr></tbody>').appendTo('#tag-stats');
}

function renderStatTable(tableName, stats) {
    var template = tableName + 'StatisticsRowTemplate';
    var tbody = $('<tbody></tbody>');
    for (var i = 0, len = stats.length; i < len; i++) {
        $.tmpl(template, stats[i], {index: i}).appendTo(tbody);
    }
    tbody.appendTo('#' + tableName + '-stats');
}

// this.data.label: Tooltip text
let testTooltips = {
    "Critical tests": "critical",
    "Branch: 'master'": "This prints master",
    "Branch: 'randomize-constraints'": "randomize",
    "All Tests": "all",
    "Asserts &amp; Class-Params &amp; Class &amp; Event-Control-Expression &amp; Extra-Uvm-Features &amp; Randomize-Constraints &amp; Randomize &amp; Random-Variables &amp; Sequences &amp; Signal-Strengths &amp; Signal-Strengths-Should-Fail &amp; Test-Plusargs-Variable &amp; Types &amp; Virtual-Interfaces.Signal-Strengths": "This is the tooltip for this test"
}

const testfunc = function() {
        // console.log(this.data.label)
        const tooltipText = testTooltips[this.data.label] || 'There are no additional information about this test.'
        this.data.label = tooltipText
    }

$.template('statColumnsTemplate',
    '<td class="stats-col-stat">${total}</td>' +
    '<td class="stats-col-stat">${pass}</td>' +
    '<td class="stats-col-stat">${fail}</td>' +
    '<td class="stats-col-stat">${skip}</td>' +
    '<td class="stats-col-elapsed">${elapsed}</td>' +
    '<td class="stats-col-graph">' +
      '{{if total}}' +
      '<div class="graph">' +
        '<div class="pass-bar" style="width: ${passWidth}%" title="${passPercent}%"></div>' +
        '<div class="fail-bar" style="width: ${failWidth}%" title="${failPercent}%"></div>' +
        '<div class="skip-bar" style="width: ${skipWidth}%" title="${skipPercent}%"></div>' +
      '</div>' +
      '{{else}}' +
      '<div class="empty-graph"></div>' +
      '{{/if}}' +
      '<td class="stats-col-stat-img"><div class="tooltip"><div class="more-info-button"></div><span class="tooltiptext" onload=${testfunc}>${label}</span></div></td>' +
    '</td>'
);

$.template('suiteStatusMessageTemplate',
    '${total} {{= testOrTask("{test}")}}{{if total != 1}}s{{/if}} total, ' +
    '${pass} passed, ${fail} failed, ${skip} skipped'
);

// For complete cross-browser experience..
// http://www.quirksmode.org/js/events_order.html
function stopPropagation(event) {
    var event = event || window.event;
    event.cancelBubble = true;
    if (event.stopPropagation)
        event.stopPropagation();
}
