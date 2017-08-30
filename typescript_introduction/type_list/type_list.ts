// Boolean
let paidMyAccount : boolean = true;

// Number
let age : number = 33;
var taxRate : number = 7.5;

// String
var fullName : string = "Sammy";

// Array
var ages : number[] = [33, 27, 11];

// Tuple (format must match exatcly to not throw an error when assigning)
let player : [number, string];
player = [3, "John"];

// Enum
enum ApprovalStatus {Approved, Pending, Rejected};
let job : ApprovalStatus = ApprovalStatus.Pending;

// Any
var apiData : any[] = ["sam", true, 123];

// Void (method that returns nothing)
function printOut(msg: string) : void {
  console.log(msg);
}
