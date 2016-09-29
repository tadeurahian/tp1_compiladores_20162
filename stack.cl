(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class StackCommand inherits IO {
  command : String;
  isInt : Bool;

  getCommand() : String {
    command
  };

  setCommand(com : String) : Object {
    command <- com
  };

  setIsIntTrue() : Object {
    isInt <- true
  };

  isInt() : Bool {
    isInt
  };
};

class ECommand inherits StackCommand {
  init() : Object {
    setCommand("e")
  };
};

class PlusCommand inherits StackCommand {
  init() : Object {
    setCommand("+")
  };
};

class SCommand inherits StackCommand {
  init() : Object {
    setCommand("s")
  };
};

class DCommand inherits StackCommand {
  init() : Object {
    setCommand("d")
  };
};

class IntCommand inherits StackCommand {
  a2iObj:A2I;

  init(command : Int) : Object {{
    a2iObj <- new A2I;
    setCommand(a2iObj.i2c(command));
    setIsIntTrue();
  }};

  getAsInt() : Int {
    a2iObj.c2i(getCommand())
  };
};

class Stack inherits IO {
  top : Stack;
  value: StackCommand;

  getStackCommand() : StackCommand {
    value
  };

  setStackCommand(command : StackCommand) : Object {
    value <- command
  };

  setTop(newTop : Stack) : Object {
    top <- newTop
  };

  getTop() : Stack {
    top
  };
};

class Main inherits IO {
   keepGoing : Bool;
   stringRead : String;
   currentCommand : StackCommand;

  createCommand(char : String) : StackCommand {{
    if char = "e" then
      (new ECommand).init()
    else if char = "d" then
      (new DCommand).init()
    else if char = "+" then
      (new PlusCommand).init()
    else if char = "s" then
      (new SCommand).init()
    else
      (new IntCommand).init(char)
   }};

   main() : Object {{
      keepGoing <- true;
      commandRead <- "";

      out_string("TP 1 Compiladores 2016/2\n");
      out_string("Digite seus comandos:\n");

      while keepGoing loop {
        out_string(">");
        stringRead <- in_string();

        if stringRead = x then {
          keepGoing <- false;
          fi
        }

        currentCommand <- createCommand(stringRead);
      }
   }};

};
