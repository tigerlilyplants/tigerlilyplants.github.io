---
layout: page
title: Success
# permalink: /contact-success/
---

<!-- <h2></h2> -->
<p class="subtext">Your message was sent. We'll be in touch soon.</p>

<!-- Refresh countdown -->
<p class="subtext" id="countdown"></p>

<script>
var distance = 3;


/**
 * "Redirect"-message countdown updater.
 */
function redirectCountdown() {
    // If the count down is over, write some text
    if (distance <= 0) {
            clearInterval(distance);
            document.getElementById("countdown").innerHTML = "Redirecting...";

            if (window.location.origin.startsWith("http://127")) {
                window.location.replace("http://127.0.0.1:4000/");
            } else {
                window.location.replace("https://tiger-lily-plants.com");
            }
    } else {
        // Output the result in an element with id="demo"
        document.getElementById("countdown").innerHTML = "Redirecting in " + distance + "s";
        distance--;
    }
}


redirectCountdown();


// Update the count down every 1 second
setInterval(redirectCountdown, 1000);
</script>