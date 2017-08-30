// Boolean
var paidMyAccount = true;
// Number
var age = 33;
var taxRate = 7.5;
// String
var fullName = "Sammy";
// Array
var ages = [33, 27, 11];
// Tuple (format must match exatcly to not throw an error when assigning)
var player;
player = [3, "John"];
// Enum
var ApprovalStatus;
(function (ApprovalStatus) {
    ApprovalStatus[ApprovalStatus["Approved"] = 0] = "Approved";
    ApprovalStatus[ApprovalStatus["Pending"] = 1] = "Pending";
    ApprovalStatus[ApprovalStatus["Rejected"] = 2] = "Rejected";
})(ApprovalStatus || (ApprovalStatus = {}));
;
var job = ApprovalStatus.Pending;
// Any
var apiData = ["sam", true, 123];
// Void (method that returns nothing)
function printOut(msg) {
    console.log(msg);
}
//# sourceMappingURL=type_list.js.map