var fullName3 = (first, last) => {
	return first + " " + last;
}

console.log(fullName3('Jordan', 'Hudgens'));

// Jordan Hudgens

var gradeGenerator3 = (grade: number) : string => {
  if (grade < 60) {
  	return 'F';
  } else if (grade >= 60 && grade < 70) {
  	return 'D';
  } else if (grade >= 70 && grade < 80) {
  	return 'C';
  } else if (grade >= 80 && grade < 90) {
  	return 'B';
  } else {
  	return 'A';
  }
}

console.log(gradeGenerator3(45));
console.log(gradeGenerator3(100));
console.log(gradeGenerator3(80));

// F
// A
// B
