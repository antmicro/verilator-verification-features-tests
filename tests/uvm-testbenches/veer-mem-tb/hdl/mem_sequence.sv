//-------------------------------------------------------------------------
//						mem_sequence's - www.verificationguide.com
//-------------------------------------------------------------------------

//=========================================================================
// mem_sequence - random stimulus
//=========================================================================
class mem_sequence extends uvm_sequence#(mem_seq_item);

  `uvm_object_utils(mem_sequence)

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "mem_sequence");
    super.new(name);
  endfunction

  `uvm_declare_p_sequencer(mem_sequencer)

  //---------------------------------------
  // create, randomize and send the item to driver
  //---------------------------------------
  virtual task body();
   repeat(2) begin
    req = mem_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.addr[1:0] = 2'd0; // Align to 4
    send_request(req);
    wait_for_item_done();
   end
  endtask
endclass
//=========================================================================

//=========================================================================
// write_sequence - "write" type
//=========================================================================
class write_sequence extends uvm_sequence#(mem_seq_item);

  `uvm_object_utils(write_sequence)

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "write_sequence");
    super.new(name);
  endfunction

  virtual task body();
    req = mem_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.wr_en = 1'b1;
    req.rd_en = 1'b0;
    send_request(req);
    wait_for_item_done();
  endtask
endclass
//=========================================================================

//=========================================================================
// read_sequence - "read" type
//=========================================================================
class read_sequence extends uvm_sequence#(mem_seq_item);

  `uvm_object_utils(read_sequence)

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "read_sequence");
    super.new(name);
  endfunction

  virtual task body();
    req = mem_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.wr_en = 1'b0;
    req.rd_en = 1'b1;
    send_request(req);
    wait_for_item_done();
  endtask
endclass
//=========================================================================

//=========================================================================
// write_read_sequence - "write" followed by "read"
//=========================================================================
class write_read_sequence extends uvm_sequence#(mem_seq_item);

  `uvm_object_utils(write_read_sequence)

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "write_read_sequence");
    super.new(name);
  endfunction

  virtual task body();

    // Do randomized write
    req = mem_seq_item::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.wr_en = 1'b1;
    req.rd_en = 1'b0;
    send_request(req);
    wait_for_item_done();

    // Do read from the same address
    wait_for_grant();
    req.wr_en = 1'b0;
    req.rd_en = 1'b1;
    send_request(req);
    wait_for_item_done();

  endtask
endclass
//=========================================================================


//=========================================================================
// wr_rd_sequence - "write" followed by "read" (sequence's inside sequences)
//=========================================================================
class wr_rd_sequence extends uvm_sequence#(mem_seq_item);

  //---------------------------------------
  //Declaring sequences
  //---------------------------------------
  write_read_sequence seq;

  `uvm_object_utils(wr_rd_sequence)

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "wr_rd_sequence");
    super.new(name);
  endfunction

  virtual task body();
    repeat(10) begin
      `uvm_do(seq)
    end
  endtask
endclass
//=========================================================================
