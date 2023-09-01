const firstName = document.getElementById("firstname");
const lastName = document.getElementById("lastname");
const email = document.getElementById("mail");
const userid = document.getElementById("userid");
const printForm = document.getElementById("user");
const display = document.getElementById("form-result");
const handlePrint = (e) => {
    e.preventDefault(); // Prevents the window from moving
    const fn = firstName.value;
    const ln = lastName.value;
    const em = email.value;
    const id = userid.value;
    const diplaySpan = display.querySelector("span"); // Select the span tag inside the tag with id form-result
    diplaySpan.innerHTML = `First Name is: ${fn}<br>
    Last Name is: ${ln}<br>
    E-mail is: ${em}<br>
    ID is: ${id}`;
};
printForm.addEventListener("submit", handlePrint);
