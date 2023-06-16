# 1.Variables:
Variables are declared using the let or const keyword.  
TypeScript supports type annotations to specify the data type of a variable.  
Example:
```
let name: string = 'John';
const age: number = 25;
```

#### let keyword:
Variables declared with let are mutable, meaning their values can be reassigned.  
let variables have block scope, which means they are only accessible within the block where they are defined.  
You can declare a let variable without assigning an initial value, and assign a value later.  
Example:
```
let name: string;
name = 'John'; // Value can be assigned/reassigned
```
#### const keyword:

Variables declared with const are immutable, meaning their values cannot be reassigned once they are initialized.
const variables also have block scope like let.
const variables must be assigned an initial value during declaration, and you cannot assign a new value to them later.
Example:
```
const age: number = 25;
// age = 30; // Error: Cannot assign to 'age' because it is a constant
```
It is generally recommended to use const whenever possible to make variables immutable, as it provides clearer code and prevents accidental reassignment. Use let when you need a variable that can be reassigned.


# 2.Data Types:
TypeScript has several built-in data types, including number, string, boolean, object, array, and more.
Type annotations can be used to specify the data type of variables, function parameters, and return values.
Example:
```
    let quantity: number = 10;  
    let message: string = 'Hello, TypeScript!';  
    let isDone: boolean = false;  
    let numbers: number[] = [1, 2, 3];  
```
# 3. Functions:
### Function Declaration:
    Functions are declared using the function keyword followed by the function name.
    The function name is followed by parentheses () which can optionally contain parameters.
    The function body is enclosed within curly braces {}.
            
    Example:
```
function addNumbers(a: number, b: number): number {
    return a + b;
}
```
In the example, addNumbers is a function that takes two parameters (a and b) of type number and returns a value of type number.
        
### Function Parameters:
    Parameters are the variables declared within the function's parentheses ().
    Parameters specify the data type of the values that the function expects to receive when it is called.

### Return Type:
    The return type of a function specifies the data type of the value that the function will return.
    It is declared after the parameter list with a colon :, followed by the desired return type.
### Function Invocation:
    Functions are invoked by using the function name followed by parentheses ().
    If the function has parameters, their values can be passed within the parentheses.
Example:
```
const result = addNumbers(3, 4);
```
### Optional and Default Parameters:
    Function parameters can be made optional by appending a question mark '?' after the parameter name.
    Default parameter values can be assigned using the assignment operator '='.
example:
#### default paarameters:
```
function greet(name: string = 'Anonymous'): void {
  console.log(`Hello,', ${name}!);
}
```
#### optional parameters:
```   
function greet(name?: string): void {
  if (name) {
    console.log(`Hello, ${name}!`);
  } else {
    console.log('Hello!');
  }
}

greet(); // Output: Hello!
greet('John'); // Output: Hello, John!
```
# 4.classes:
     Classes provide a way to define blueprints for creating objects with properties and methods.
     They can have constructors, properties, and methods.
     Inheritance and access modifiers (public, private, protected) are supported.
     Classes allow you to create reusable and structured code
   
### Class Declaration:
    Classes are declared using the class keyword followed by the class name.
    The class name should be in PascalCase (capitalized first letter).
Example:
```
class Person {
  // class members (properties and methods) go here
}
```
### Properties:
    Properties are variables defined within a class.
    They store data specific to each instance of the class (objects).
Example:
```
class Person {
  name: string;
  age: number;
}
```
In the example, 'name' and 'age' are properties of the 'Person' class. Each object created from this class will have its own 'name' and 'age' properties.

### Constructor:
The constructor is a special method that is automatically called when an object is created from the class.
It is defined using the constructor keyword followed by parentheses ().
It is used to initialize the object's properties and perform any setup tasks.
It does not have a return type, not even void.
example:
```
class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
```
In the example, the Person class has a constructor that takes name and age parameters. When a Person object is created, the constructor is called and the provided values are used to initialize the object's properties.
#### constructor invocation:
```
const person = new Person('John', 25);
```
In the example, the 'Person' object named 'person' is created by invoking the constructor with the arguments 'John' and 25. The constructor is executed, and the object is initialized with the provided values.

### Methods:
Methods are functions defined within a class.
They perform actions or provide functionality related to the class.
Example:
```
class Person {
  name: string;
  age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  sayHello(): void {
    console.log(`Hello, my name is ${this.name}.`);
  }
}
```
```
let person = new Person('deepak',25);
person.sayHello();
```
```
output:
Hello, my name is deepak.
```

### Access Modifiers:
TypeScript provides access modifiers (public, private, and protected) to control the visibility and accessibility of class members (properties and methods).

public is the default access modifier if not specified explicitly.

Example:
```
class Person {
  public name: string;
  private age: number;
  protected email: string;

  // ...
}
```
In the example, name is a public property accessible from anywhere, age is a private property accessible only within the class itself, and email is a protected property accessible within the class and its subclasses.

# interfaces:
Interfaces define the structure of an object and can be used to enforce type checking.
They specify the names and types of properties and can also include optional and readonly properties.
example:
```
interface Shape {
  name: string;
  area(): number;
}

class Circle implements Shape {
  name: string;
  radius: number;

  constructor(radius: number) {
    this.name = 'Circle';
    this.radius = radius;
  }

  area(): number {
    return Math.PI * this.radius ** 2;
  }
}

const circle = new Circle(5);
console.log(circle.area());
```

# modules:
Modules are used to organize and encapsulate code into separate files or modules.
TypeScript supports the import and export keywords to import and export modules.
Example:
```
// myModule.ts
export const greeting = 'Hello, TypeScript!';
```
```
// main.ts
import { greeting } from './myModule';
console.log(greeting);
```
