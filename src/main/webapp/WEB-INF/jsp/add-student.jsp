<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student System</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/add-student.css">
        <link rel="stylesheet" href="../css/add-student.css">
    </head>
    <body>
        <div class="main">
            <div class="header">
                <p class="header-text">
                    <a href="/" style="text-decoration: none; padding-right: 3px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
                    </a>
                    <c:choose>
                        <c:when test="${isNewStudent}">
                            Add Student
                        </c:when>
                        <c:otherwise>
                            Update Student
                        </c:otherwise>
                    </c:choose>
                </p>
                <button class="add-btn" form="student-form" type="submit" value="submit">Confirm</button>
            </div>
            
            <div class="form-container">
                <form:form id="student-form" action="/${isNewStudent ? 'new' : 'edit/'}${isNewStudent ? '' : student.id}" method="post" modelAttribute="student">
                    <div class="form-field">
                        <form:label path="name" class="form-label">Name</form:label>
                        <form:input required="required" path="name" placeholder="Bryan Soong" id="form-input-name" class="form-input"/>
                    </div>
                    
                    <div class="form-field">
                        <form:label path="gender" class="form-label">Gender</form:label>
                        <form:select required="required" path="gender" id="form-input-gender" class="form-input">
                            <option selected disabled value="">Select</option>
                            <form:option value="M">Male</form:option>
                            <form:option value="F">Female</form:option>
                        </form:select>
                    </div>

                    <div class="form-field">
                        <form:label path="dob" class="form-label">Date of Birth</form:label>
                        <form:input required="required" path="dob" type="date" id="form-input-dob" class="form-input"/>
                    </div>

                    <div class="form-field">
                        <form:label path="email" class="form-label">Email</form:label>
                        <form:input required="required" path="email" type="email" placeholder="bryansoong35@gmail.com" id="form-input-email" class="form-input"/>
                    </div>

                    <div class="form-field">
                        <form:label path="mobile" class="form-label">Mobile</form:label>
                        <form:input required="required" path="mobile" placeholder="+60172603164" type="text" pattern="^(\+\d{1,3})\d{10}" id="form-input-mobile" class="form-input"/>
                    </div>
                    
                    <div class="form-field">
                        <form:label path="address" class="form-label">Address</form:label>
                        <form:textarea required="required" rows="3" cols="45" path="address" id="form-input-address" class="form-input"/>
                    </div>
                </form:form>
            </div>

        </div>
    </body>
</html>