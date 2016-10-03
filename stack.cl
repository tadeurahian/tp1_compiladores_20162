(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class StackElement {
  elementBelow : StackElement;
  value : String;

  init(val : String) : Object {
    value <- val
  };

  getValue() : String {
    value
  };

  setElementBelow(below : StackElement) : Object {
    elementBelow <- below
  };

  getElementBelow() : StackElement {
    elementBelow
  };
};

class Stack inherits IO {
  head : StackElement;
  temp : StackElement;

  push(element : StackElement) : Object {{
    element.setElementBelow(head);
    head <- element;
  }};

  pop() : StackElement {{
    if not isvoid head then {
      temp <- head;
      head <- head.getElementBelow();
      temp;
    } else 
      head
    fi;
  }};

  printStack() : Object {{
    temp <- head;

    while not isvoid temp loop {
      out_string(temp.getValue());
      out_string("\n");
      temp <- temp.getElementBelow();
    }
    pool;
  }};
};

class Main inherits IO {
   keepGoing : Bool;
   stringRead : String;
   stack : Stack;
   tempElement : StackElement;
   command : StackElement;
   head1 : StackElement;
   head2 : StackElement;
   intAux : Int;
   a2i : A2I;

   main() : Object {{
      out_string("TP 1 Compiladores 2016/2 - Tadeu Rahian\n");
      out_string("Digite seus comandos:\n");

      keepGoing <- true;
      stringRead <- "";
      a2i <- new A2I;

      while keepGoing loop {
        out_string(">");
        stringRead <- in_string();
        stack <- new Stack;
        intAux <- 0;

        if stringRead = "d" then
          stack.printStack()
        else if stringRead = "x" then
          keepGoing <- false
        else if stringRead = "e" then {
          command <- stack.pop();

          if not isvoid command then {
            if commmand.getValue() = "+" then {
              head1 <- stack.pop();
              head2 <- stack.pop();

              intAux <- a2i.c2i(head1.getValue()) + a2i.c2i(head2.getValue());
              out_string(a2i.i2c(intAux));
            } else if command.getValue() = "s" then {
                head1 <- stack.pop();
                head2 <- stack.pop();

                stack.push(head1);
                stack.push(head2);
            } else {
              stack.push(command);
            }
            fi fi;
          } else {
            tempElement <- new StackElement;
            tempElement.init(stringRead);
            stack.push(tempElement);
          }
          fi;
        }
        fi fi fi;
      }
      pool;
   }};
};
