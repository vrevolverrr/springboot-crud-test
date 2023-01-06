package com.example.application.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.application.model.Student;
import com.example.application.repository.StudentRepository;

@Service
public class StudentService {
    @Autowired
    StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<Student>();
        studentRepository.findAll().forEach(s -> students.add(s));

        return students;
    }
    
    public Student getStudentById(int id) {
        return studentRepository.findById(id).get();
    }

    public void save(Student student) {
        studentRepository.save(student);
    }

    public void delete(int id) {
        studentRepository.deleteById(id);
    }

    public void update(Student student, int id) {
        student.setId(id);
        studentRepository.save(student);
    }
}
