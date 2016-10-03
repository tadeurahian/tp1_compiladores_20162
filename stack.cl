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
    temp <- head;
    head <- head.getElementBelow();
    temp;
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
   poppedValue : StackElement;
   poppedValue1 : StackElement;
   poppedValue2 : StackElement;
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

        if stringRead = "d" then
          stack.printStack()
        else if stringRead = "x" then
          keepGoing <- false
        else if stringRead = "e" then {
          poppedValue <- stack.pop();

          if poppedValue = "+" then {
            poppedValue1 <- stack.pop();
            poppedValue2 <- stack.pop();

            intAux <- a2i.c2i(poppedValue1) + a2i.c2i(poppedValue2);

            out_string(a2i.i2c(intAux));
          } else {
            poppedValue1 <- stack.pop();
            poppedValue2 <- stack.pop();

            stack.push(poppedValue2);
            stack.push(poppedValue1);
          }
          fi;
        }
        else {
          tempElement <- new StackElement;
          tempElement.init(stringRead);
          stack.push(tempElement);
        }
        fi fi fi;
      }
      pool;
   }};

};
