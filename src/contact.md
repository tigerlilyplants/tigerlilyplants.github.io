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
		console.info("The form was submitted: ", response.status);
		window.location.href("https://tiger-lily-plants.com/contact-success/");
		const form = document.getElementById("contact-form");

		// Convert the form data to a URL-encoded string.
		const formData = new FormData(form);
		const params = new URLSearchParams(formData);

		const response = fetch(
			'https://formspree.io/f/xvgpzzal',
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
				window.location.href("https://tiger-lily-plants.com/contact-success/");
			}
		)

		return false;
	}
</script>

<div class="contact-box">
	<form id="contact-form" onsubmit="return contactFormSubmit()" class="contact-form">
		<label for="firstname">First</label>
		<br/>
		<input type="text" name="firstname" id="firstname" required />
		<br/>
		<label for="lastname">Last</label>
		<br/>
		<input type="text" name="lastname" id="lastname" required />
		<br/>
		<label for="email">Email</label>
		<br/>
		<input type="email" name="email" id="email" placeholder="contact@example.com" required />
		<br/>
		<label for="company">Company</label>
		<br/>
		<input type="text" name="company" id="company" placeholder="Example, Inc." required />
		<br/>
		<label for="phonenumber">Phone Number</label>
		<br/>
		<input type="tel" name="phonenumber" id="phonenumber" pattern="[0-9]{3}-?[0-9]{3}-?[0-9]{4}" placeholder="012-345-6789" />
		<br/>
		<label for="message">Message</label>
		<br/>
		<textarea name="message" id="message" placeholder="type your message" required></textarea>
		<br/>
		<input type="submit" />
	</form>
</div>