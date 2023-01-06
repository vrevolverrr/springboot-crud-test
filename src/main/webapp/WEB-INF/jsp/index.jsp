<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student System</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
        <script type="text/javascript" src="js/index.js"></script>
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <div class="table-container">
            <div class="header">
                <p class="header-text">Students</p>
                <a class="add-btn" href="/new">New Student</a>
            </div>
            <c:if test="${status}">
                <div class="banner">
                    The student&nbsp<span style="font-weight: 700;">${studentName}</span>&nbspwas succesfully
                    <c:choose>
                        <c:when test="${wasModified}">
                            updated
                        </c:when>
                        <c:otherwise>
                            added
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
            <div class="search-container">
                <input class="search-bar" placeholder="Search student" />
                <label for="search-sort-hidden-checkbox" id="search-sort-hidden-label" onclick="(() => {
                    if (!document.querySelector('#search-sort-hidden-checkbox').checked) {
                        document.querySelector('.search-sort').style = 'border: 2px solid #242424'
                    } else {
                        document.querySelector('.search-sort').style = 'border: none'
                    }
                })()">
                    <div class="search-sort">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#5c5c5c" height="12" width="12" viewBox="0 0 512 512"><path d="M3.9 54.9C10.5 40.9 24.5 32 40 32H472c15.5 0 29.5 8.9 36.1 22.9s4.6 30.5-5.2 42.5L320 320.9V448c0 12.1-6.8 23.2-17.7 28.6s-23.8 4.3-33.5-3l-64-48c-8.1-6-12.8-15.5-12.8-25.6V320.9L9 97.3C-.7 85.4-2.8 68.8 3.9 54.9z"/></svg>
                        <p>Filters</p>
                    </div>
                </label>
                <button class="search-submit-btn" onclick="handleSearch()">Search</button>
            </div>
            <input type="checkbox" id="search-sort-hidden-checkbox" style="display: none;"/>
            <div class="search-sort-content">
                <div class="search-criteria-container">
                    <p class="search-criteria-title">Criteria</p>
                    <div class="search-criteria-icons-container">
                        <label for="search-criteria-icons-name">Name</label>
                        <input type="checkbox" class="search-criteria-icons" id="search-criteria-icons-name" name="name" checked />
                        
                        <label for="search-criteria-icons-address">Address</label>
                        <input type="checkbox" class="search-criteria-icons" id="search-criteria-icons-address" name="address" checked />
                        
                        <label for="search-criteria-icons-email">Email</label>
                        <input type="checkbox" class="search-criteria-icons" id="search-criteria-icons-email" name="email" checked />

                        <label for="search-criteria-icons-address">Mobile</label>
                        <input type="checkbox" class="search-criteria-icons" id="search-criteria-icons-mobile" name="mobile" checked />
                    </div>
                </div>
                <div class="filters-container">
                    <p class="filters-title">Filters</p>
                    <div class="filters-icons-container">
                        <label for="filter-icons-gender">Gender</label>
                        <select class="filters-icons" id="filter-icons-gender" name="gender">
                            <option value="A">Any</option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                        </select>

                        <label for="filter-icons-dob">DOB</label>
                        <input type="date" class="filters-icons" id="filter-icons-dob" name="dob" />
                    </div>
                </div>
            </div>
            <table class="main-table">
                <script>
                    var studentList = []
                </script>
                <tr>
                    <th class="th-no">No</th>
                    <th class="th-name">
                        Name
                        <svg xmlns="http://www.w3.org/2000/svg" onclick="renderTableBy('name')" width="20" height="20" style="cursor:pointer; position:absolute; transform:scale(0.7) translate(2px, -3px);"><path fill="#5c5c5c" d="M7.175 4.386a.997.997 0 0 1 .552-.35c.178-.048.367-.048.544 0a.997.997 0 0 1 .555.35L11.7 7.145c.399.381.399 1 0 1.382l-.032.03a1.05 1.05 0 0 1-1.442 0L9.042 7.422V15c0 .552-.446 1-.997 1h-.09a.999.999 0 0 1-.997-1V7.42L5.773 8.558a1.05 1.05 0 0 1-1.442 0l-.032-.031a.949.949 0 0 1 0-1.382l2.876-2.758zm9.65 15.228a.997.997 0 0 1-.552.35 1.067 1.067 0 0 1-.544 0 .996.996 0 0 1-.555-.35L12.3 16.855a.949.949 0 0 1 0-1.382l.032-.03a1.05 1.05 0 0 1 1.442 0l1.185 1.135V9c0-.552.446-1 .997-1h.09c.55 0 .997.448.997 1v7.58l1.185-1.137a1.05 1.05 0 0 1 1.442 0l.032.031c.398.382.398 1 0 1.382l-2.876 2.758z"/></svg>
                    </th>
                    <th class="th-address">
                        Address
                        <svg xmlns="http://www.w3.org/2000/svg" onclick="renderTableBy('address')" width="20" height="20" style="cursor:pointer; position:absolute; transform:scale(0.7) translate(2px, -3px);"><path fill="#5c5c5c" d="M7.175 4.386a.997.997 0 0 1 .552-.35c.178-.048.367-.048.544 0a.997.997 0 0 1 .555.35L11.7 7.145c.399.381.399 1 0 1.382l-.032.03a1.05 1.05 0 0 1-1.442 0L9.042 7.422V15c0 .552-.446 1-.997 1h-.09a.999.999 0 0 1-.997-1V7.42L5.773 8.558a1.05 1.05 0 0 1-1.442 0l-.032-.031a.949.949 0 0 1 0-1.382l2.876-2.758zm9.65 15.228a.997.997 0 0 1-.552.35 1.067 1.067 0 0 1-.544 0 .996.996 0 0 1-.555-.35L12.3 16.855a.949.949 0 0 1 0-1.382l.032-.03a1.05 1.05 0 0 1 1.442 0l1.185 1.135V9c0-.552.446-1 .997-1h.09c.55 0 .997.448.997 1v7.58l1.185-1.137a1.05 1.05 0 0 1 1.442 0l.032.031c.398.382.398 1 0 1.382l-2.876 2.758z"/></svg>
                    </th>
                    <th class="th-gender">Gender</th>
                    <th class="th-dob">
                        DOB
                        <svg xmlns="http://www.w3.org/2000/svg" onclick="renderTableBy('dob')" width="20" height="20" style="cursor:pointer; position:absolute; transform:scale(0.7) translate(2px, -3px);"><path fill="#5c5c5c" d="M7.175 4.386a.997.997 0 0 1 .552-.35c.178-.048.367-.048.544 0a.997.997 0 0 1 .555.35L11.7 7.145c.399.381.399 1 0 1.382l-.032.03a1.05 1.05 0 0 1-1.442 0L9.042 7.422V15c0 .552-.446 1-.997 1h-.09a.999.999 0 0 1-.997-1V7.42L5.773 8.558a1.05 1.05 0 0 1-1.442 0l-.032-.031a.949.949 0 0 1 0-1.382l2.876-2.758zm9.65 15.228a.997.997 0 0 1-.552.35 1.067 1.067 0 0 1-.544 0 .996.996 0 0 1-.555-.35L12.3 16.855a.949.949 0 0 1 0-1.382l.032-.03a1.05 1.05 0 0 1 1.442 0l1.185 1.135V9c0-.552.446-1 .997-1h.09c.55 0 .997.448.997 1v7.58l1.185-1.137a1.05 1.05 0 0 1 1.442 0l.032.031c.398.382.398 1 0 1.382l-2.876 2.758z"/></svg>
                    </th>
                    <th class="th-email">
                        Email
                        <svg xmlns="http://www.w3.org/2000/svg" onclick="renderTableBy('email')" width="20" height="20" style="cursor:pointer; position:absolute; transform:scale(0.7) translate(2px, -3px);"><path fill="#5c5c5c" d="M7.175 4.386a.997.997 0 0 1 .552-.35c.178-.048.367-.048.544 0a.997.997 0 0 1 .555.35L11.7 7.145c.399.381.399 1 0 1.382l-.032.03a1.05 1.05 0 0 1-1.442 0L9.042 7.422V15c0 .552-.446 1-.997 1h-.09a.999.999 0 0 1-.997-1V7.42L5.773 8.558a1.05 1.05 0 0 1-1.442 0l-.032-.031a.949.949 0 0 1 0-1.382l2.876-2.758zm9.65 15.228a.997.997 0 0 1-.552.35 1.067 1.067 0 0 1-.544 0 .996.996 0 0 1-.555-.35L12.3 16.855a.949.949 0 0 1 0-1.382l.032-.03a1.05 1.05 0 0 1 1.442 0l1.185 1.135V9c0-.552.446-1 .997-1h.09c.55 0 .997.448.997 1v7.58l1.185-1.137a1.05 1.05 0 0 1 1.442 0l.032.031c.398.382.398 1 0 1.382l-2.876 2.758z"/></svg>
                    </th>
                    <th class="th-mobile">Mobile</th>
                    <th class="th-options"></th>
                </tr>
                <c:forEach items="${students}" var="student" varStatus="loop">
                    <script>
                        studentEntry = {
                            id: '${student.id}',
                            name: '${student.name}',
                            address: '${student.address}',
                            gender: '${student.gender}',
                            dob: '${student.dob}',
                            email: '${student.email}',
                            mobile: '${student.mobile}'
                        }
                        studentList.push(studentEntry)
                    </script>
                    <tr>
                        <td class="td-no">${loop.index + 1}</th>
                        <td class="td-name">${student.name}</td>
                        <td class="td-address">${student.address}</td>
                        <td class="td-gender">${student.gender}</td>
                        <td class="td-dob">${student.dob}</td>
                        <td class="td-email">${student.email}</td>
                        <td class="td-mobile">${student.mobile}</td>
                        <td>
                            <div class="td-options">
                                <p class="td-options-icon">⋮</p>
                                <div class="td-options-content">
                                    <div class="td-options-content-item">
                                        <a href="/edit/${student.id}">Edit</a>
                                    </div>
                                    <div class="td-options-content-item">
                                        <a href="/delete/${student.id}">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>

</html>