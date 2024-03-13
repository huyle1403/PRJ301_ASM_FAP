/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Huy
 */
public class Point {
    private Subject subject;
    private Student student;
    private int progressTest1,progressTest2,participation,assignment,practicalExam,finalExam;
    private String StudentName;
    public Point() {
    }

    public Point(Subject subject, Student student, int progressTest1, int progressTest2, int participation, int assignment, int practicalExam, int finalExam, String StudentName) {
        this.subject = subject;
        this.student = student;
        this.progressTest1 = progressTest1;
        this.progressTest2 = progressTest2;
        this.participation = participation;
        this.assignment = assignment;
        this.practicalExam = practicalExam;
        this.finalExam = finalExam;
        this.StudentName = StudentName;
    }

  

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getProgressTest1() {
        return progressTest1;
    }

    public void setProgressTest1(int progressTest1) {
        this.progressTest1 = progressTest1;
    }

    public int getProgressTest2() {
        return progressTest2;
    }

    public void setProgressTest2(int progressTest2) {
        this.progressTest2 = progressTest2;
    }

    public int getParticipation() {
        return participation;
    }

    public void setParticipation(int participation) {
        this.participation = participation;
    }

    public int getAssignment() {
        return assignment;
    }

    public void setAssignment(int assignment) {
        this.assignment = assignment;
    }

    public int getPracticalExam() {
        return practicalExam;
    }

    public void setPracticalExam(int practicalExam) {
        this.practicalExam = practicalExam;
    }

    public int getFinalExam() {
        return finalExam;
    }

    public void setFinalExam(int finalExam) {
        this.finalExam = finalExam;
    }
    
    
}
