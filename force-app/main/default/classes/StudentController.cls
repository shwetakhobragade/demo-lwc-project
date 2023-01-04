public class StudentController {
    public string student{get;set;}
    public StudentController() {
        student='abc';
    }
    public void fetchstudent(){
        student='pqr';
    }
}