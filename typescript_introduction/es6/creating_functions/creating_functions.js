function fullName2(first, last) {
    return first + " " + last;
}
console.log(fullName2("Sam", "Holst"));
// : string means that the function will return a string
function gradeGenerator(grade) {
    if (grade < 60) {
        return "F";
    }
    else if (grade >= 60 && grade < 70) {
        return "D";
    }
    else if (grade >= 70 && grade < 80) {
        return "C";
    }
    else if (grade >= 80 && grade < 90) {
        return "B";
    }
    else {
        return "A";
    }
}
console.log(gradeGenerator(45));
console.log(gradeGenerator(100));
console.log(gradeGenerator(80));
//# sourceMappingURL=creating_functions.js.map