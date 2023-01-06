package com.example.application.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.application.model.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Integer> {
    
}