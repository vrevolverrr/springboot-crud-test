document.addEventListener("DOMContentLoaded", () => {
    document.querySelector(".search-bar").addEventListener("keypress", event => {
        if (event.key === "Enter") {
            handleSearch()
        }
    })
})

function handleSearch() {
    const searchTerm = document.querySelector(".search-bar").value
    const searchName = document.querySelector("#search-criteria-icons-name").checked
    const searchAddress = document.querySelector("#search-criteria-icons-address").checked
    const searchEmail = document.querySelector("#search-criteria-icons-email").checked
    const searchMobile = document.querySelector("#search-criteria-icons-mobile").checked
    const gender = document.querySelector("#filter-icons-gender").value
    const dob = document.querySelector("#filter-icons-dob").value

    const searchResult = search(searchTerm, searchName, searchAddress, searchEmail, searchMobile, gender, dob)
    renderTable(searchResult)
}

function search(searchTerm, searchName = true, searchAddress = true, searchEmail = true, searchMobile = true, gender = 'A', dob = "") {
    const tokens = searchTerm.toLowerCase().split(' ').filter(e => {
        return e.trim() != ''
    })

    var matchedList

    if (tokens.length != 0) {
        const regex = new RegExp(tokens.join('|'), "gim")
        
        matchedList = studentList.filter(student => {
            var studentString = ""
    
            if (searchName) studentString += student.name + " "
            if (searchAddress) studentString += student.address + " "
            if (searchEmail) studentString += student.email + " "
            if (searchMobile) studentString += student.mobile + " "

            return studentString.trim().match(regex)
        })
    } else {
        matchedList = [...studentList]
    }

    if (gender != 'A') {
        for (let i = matchedList.length - 1; i >= 0; i--) {
            if (matchedList[i].gender != gender) matchedList.splice(i, 1)
        }
    }

    if (dob != "") {
        for (let i = matchedList.length - 1; i >= 0; i--) {
            if (matchedList[i].dob != dob) matchedList.splice(i, 1)
        }
    }

    return matchedList
}

function renderTable(students) {
    const tableBody = document.querySelector(".main-table").getElementsByTagName("tbody")[0]
    const tableChildren = tableBody.getElementsByTagName("tr")
    const headerChild = tableChildren[0]

    // Clear table
    tableBody.innerHTML = ""
    tableBody.appendChild(headerChild)

    students.forEach((student, index) => {
        tableBody.innerHTML += 
        `
        <tr>
        <td class="td-no">${index + 1}</th>
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
        `
    })
}


var tableState = {
    "name": 0,
    "address": 0,
    "dob": 0,
    "email": 0
}

function renderTableBy(column) {
    if (tableState[column] == 2) {
        renderTable(studentList)
        tableState[column] = 0
        return
    }

    var compareFunc;

    switch (column) {
        case "name":
            compareFunc = (a, b) => {
                if (a.name < b.name) return -1;
                if (a.name > b.name) return 1;
                return 0
            }
            break
        case "address":
            compareFunc = (a, b) => {
                if (a.address < b.address) return -1
                if (a.address > b.address) return 1
                return 0
            }
            break
        case "dob":
            compareFunc = (a, b) => {
                const dateA = new Date(a.dob)
                const dateB = new Date(b.dob)
        
                if (dateA < dateB) return -1
                if (dateA > dateB) return 1
                return 0
            }
            break
        case "email":
            compareFunc = (a, b) => {
                if (a.email < b.email) return -1
                if (a.email > b.email) return 1
                return 0
            }
            break
    }

    const sortedList = [...studentList]
    sortedList.sort(compareFunc)

    if (tableState[column] == 1) {
        tableState[column] = 2
        sortedList.reverse()
    } else {
        tableState[column] = 1  
    }  

    renderTable(sortedList)
}