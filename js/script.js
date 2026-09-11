document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("orderForm");
    const tableBody = document.querySelector("#orderTable tbody");
    const categoryButtons = document.querySelectorAll(".category-item");
    const serviceCards = document.querySelectorAll(".service-card");
    const filterText = document.getElementById("serviceFilterText");
    const showAllButton = document.getElementById("showAllServices");

    // Filter layanan berdasarkan kategori yang dipilih.
    function filterServices(category) {
        serviceCards.forEach((card) => {
            card.classList.toggle("is-hidden", category !== "all" && card.dataset.category !== category);
        });

        const activeButton = document.querySelector(`.category-item[data-category="${category}"]`);
        categoryButtons.forEach((button) => button.classList.remove("active"));
        if (activeButton) activeButton.classList.add("active");

        if (category === "all") {
            filterText.textContent = "Menampilkan semua jasa dari berbagai kategori.";
        } else if (activeButton) {
            const name = activeButton.querySelector("strong").textContent;
            filterText.textContent = `Menampilkan freelancer untuk kategori ${name}.`;
        }
    }

    categoryButtons.forEach((button) => {
        button.addEventListener("click", () => {
            filterServices(button.dataset.category);
            document.getElementById("layanan").scrollIntoView({ behavior: "smooth", block: "start" });
        });
    });

    showAllButton.addEventListener("click", () => {
        filterServices("all");
        document.getElementById("layanan").scrollIntoView({ behavior: "smooth", block: "start" });
    });

    // Tampilkan semua jasa saat halaman pertama kali dibuka.
    filterServices("all");

    //menambahkan data ke tabel saat form disubmit
    form.addEventListener("submit", (event) => {
        event.preventDefault();

        const data = new FormData(form);
        const values = [
            data.get("nama"),
            data.get("email"),
            data.get("telepon"),
            data.get("layanan"),
            `$${Number(data.get("budget")).toFixed(2)}`,
            data.get("tanggal"),
            data.get("deskripsi")
        ];

        const emptyRow = tableBody.querySelector(".empty-state");
        if (emptyRow) emptyRow.parentElement.remove();

        const row = document.createElement("tr");
        values.forEach((value) => {
            const cell = document.createElement("td");
            cell.textContent = value;
            row.appendChild(cell);
        });

        tableBody.appendChild(row);
        form.reset();
        row.scrollIntoView({ behavior: "smooth", block: "nearest" });
    });
});
