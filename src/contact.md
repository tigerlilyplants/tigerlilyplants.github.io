---
layout: page
title: Contact
permalink: /contact/
nav_exclude: true
---

<style type="text/css" media="screen">
  img {
    width: 90%;
    display: block;
    margin: 0 auto;
  }

  img + em {
    font-size: 0.85em;
    color: gray;
    font-style: italic;
    text-align: center;
    display: block;
  }
</style>

<script type="text/javascript">
	function contactFormSubmit() {
		// console.info("The form was submitted: ", response.status);
		// window.location.replace("http://127.0.0.1:4000/contact-success/");

		const form = document.getElementById("contact-form");

		// Convert the form data to a URL-encoded string.
		const formData = new FormData(form);
		const params = new URLSearchParams(formData);

		const response = fetch(
			'https://formspree.io/f/mbdaqadz',
			{
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: params,
				// At some point, I should handle these correctly. But, for now, we don't want to pay $10/mo. for a custom redirect domain after form submission.
				redirect: "manual"
			}
		).then(
			() => {
				console.info("The form was submitted: ", response.status);

        if (window.location.origin.startsWith("http://127")) {
            window.location.replace("http://127.0.0.1:4000/contact-success/");
        } else {
            window.location.replace("https://tiger-lily-plants.com/contact-success/");
        }
			}
		)

		return false;
	}
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const button = document.getElementById("downloadCsvBtn");
  const form = document.getElementById("contact-form");

  if (!button || !form) return;

  button.addEventListener("click", function () {

    const fields = [
      { header: "First", id: "firstname" },
      { header: "Last", id: "lastname" },
      { header: "Email", id: "email" },
      { header: "Company", id: "company" },
      { header: "Phone Number", id: "phonenumber" },
      { header: "Message", id: "message" }
    ];

    const csvEscape = (value) => {
      const s = String(value ?? "")
        .replace(/\r\n/g, "\n")
        .replace(/\r/g, "\n");
      return `"${s.replace(/"/g, '""')}"`;
    };

    const headers = fields.map(f => csvEscape(f.header)).join(",");
    const row = fields.map(f => {
      const el = document.getElementById(f.id);
      return csvEscape(el ? el.value : "");
    }).join(",");

    const csvContent = headers + "\n" + row + "\n";

    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);

    const a = document.createElement("a");
    a.href = url;
    a.download = "contact-form-data.csv";
    document.body.appendChild(a);
    a.click();

    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  });
});
</script>

<form id="contact-form" class="contact-form" action="javascript:contactFormSubmit()">

  <div>
    <label for="firstname">First</label>
    <input type="text" id="firstname" name="firstname" required >
  </div>

  <div>
    <label for="lastname">Last</label>
    <input type="text" id="lastname" name="lastname" required >
  </div>

  <div class="full-width">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required >
  </div>

  <div class="full-width">
    <label for="company">Company (optional)</label>
    <input type="text" id="company" name="company">
  </div>

  <div class="full-width">
    <label for="phonenumber">Phone Number (optional)</label>
    <input type="tel" id="phonenumber" name="phonenumber">
  </div>

  <div class="full-width">
    <label for="message">Message</label>
    <textarea minlength=25 id="message" name="message"></textarea>
  </div>

  <div class="button-row full-width">
    <button type="submit">Submit</button>
    <button type="button" id="downloadCsvBtn">CSV</button>
  </div>
</form>