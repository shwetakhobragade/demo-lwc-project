public class StudentController1 {
    public string student{get;set;}
    public LIST<String>studentList{get;set;}
    public StudentController1 (){
        studentList = new list<string>();
        studentList.add('a');
        studentList.add('b');
        student='abc';
    }
    public void fetchstudent(){
        student='pqr';
        studentList.add('c');
    }
}