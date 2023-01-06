package com.example.application.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.application.service.StudentService;

import com.example.application.model.Student;

@Controller
public class StudentController {
    @Autowired
    StudentService studentService;

    /* Table View */
    @GetMapping("/")
    public String listStudentView(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "index";
    }
    
    /* Delete Operation */
    @GetMapping("/delete/{id}")
    public String deleteStudentView(@PathVariable("id") int id, RedirectAttributes attributes) {        
        // Delete student from db        
        Student student = studentService.delete(id);

        attributes.addFlashAttribute("status", true);
        attributes.addFlashAttribute("wasDeleted", true);
        attributes.addFlashAttribute("studentName", student.getName());
        return "redirect:/";
    }

    /* Edit View */
    @GetMapping("/edit/{id}")
    public ModelAndView editStudentView(@PathVariable("id") int id) {
        // Get existing student and pass into view for editing
        Student student = studentService.getStudentById(id);
        ModelAndView modelAndView = new ModelAndView("add-student", "student", student);
        
        // Pass flag to modify view
        modelAndView.addObject("isNewStudent", false);
        return modelAndView;
    }

    /* Edit Operation */
    @PostMapping("/edit/{id}")
    public String submitEditAction(@PathVariable("id") int id, @Valid @ModelAttribute("student") Student student, RedirectAttributes attributes) {
        // Update fields of student in db with fields from new student
        studentService.update(student, id);
        
        attributes.addFlashAttribute("status", true);
        attributes.addFlashAttribute("wasModified", true);
        attributes.addFlashAttribute("studentName", student.getName());
        return "redirect:/";
    }

    /* New View */
    @GetMapping("/new")
    public ModelAndView addStudentView() {
        // Pass new student instance for binding
        ModelAndView modelAndView = new ModelAndView("add-student", "student", new Student());
        
        // Pass flag to modify view
        modelAndView.addObject("isNewStudent", true);
        return modelAndView;
    }

    /* New Operation */
    @PostMapping("/new")
    public String submitNewAction(@Valid @ModelAttribute("student") Student student, RedirectAttributes attributes) {
        // Persist student in db
        studentService.save(student);

        attributes.addFlashAttribute("status", true);
        attributes.addFlashAttribute("wasModified", false);
        attributes.addFlashAttribute("studentName", student.getName());

        return "redirect:/";
    }
}
