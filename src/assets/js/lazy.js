(() => {
  function initSlideshow(root) {
    const baseurl = root.getAttribute("data-baseurl") || "";
    const slides = Array.from(root.querySelectorAll(".slide"));
    const prevBtn = root.querySelector(".slide-nav.prev");
    const nextBtn = root.querySelector(".slide-nav.next");

    if (!slides.length) return;

    let index = Math.max(0, slides.findIndex(s => s.classList.contains("is-active")));
    if (index === -1) index = 0;

    function loadSlide(i) {
      const img = slides[i]?.querySelector("img");
      if (!img) return;

      // already loaded
      if (img.getAttribute("src")) return;

      const rel = img.getAttribute("data-src");
      if (!rel) return;

      img.dataset.loading = "1";
      img.loading = "lazy";     // still fine even though we set src on demand
      img.decoding = "async";

      img.src = baseurl + rel;

      img.addEventListener("load", () => {
        delete img.dataset.loading;
      }, { once: true });

      img.addEventListener("error", () => {
        delete img.dataset.loading;
        // optional: mark broken images
        img.alt = img.alt ? img.alt + " (failed to load)" : "Failed to load image";
      }, { once: true });
    }

    function setActive(i) {
      slides[index].classList.remove("is-active");
      index = (i + slides.length) % slides.length;
      slides[index].classList.add("is-active");

      // load the newly active slide on demand
      loadSlide(index);

      // optional: preload the next slide for snappier UX
      const nextIndex = (index + 1) % slides.length;
      loadSlide(nextIndex);
    }

    // Load the initially active slide (and the next one, also)
    loadSlide(index);
    loadSlide((index + 1) % slides.length);

    prevBtn?.addEventListener("click", () => setActive(index - 1));
    nextBtn?.addEventListener("click", () => setActive(index + 1));

    // optional: keyboard support when focused
    root.addEventListener("keydown", (e) => {
      if (e.key === "ArrowLeft") setActive(index - 1);
      if (e.key === "ArrowRight") setActive(index + 1);
    });
    root.tabIndex = 0; // make focusable for keyboard arrows
  }

  document.querySelectorAll(".slideshow").forEach(initSlideshow);
})();