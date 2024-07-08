document.addEventListener('DOMContentLoaded', () => {
    const selectedCategories = new Set();
    const buttons = document.querySelectorAll('.btn.btn-brand');
    const data = {
        ricemeals: {
            Pork: ['Fried', 'Steamed', 'Soup'],
            Beef: ['Fried', 'Steamed', 'Soup'],
            Chicken: ['Fried', 'Steamed', 'Soup'],
            Vegetables: ['Fried', 'Steamed', 'Soup']
        },
        beverages: {
            Coffee: ['Hot', 'Iced'],
            Juice: ['Tea', 'Lemonade', 'Fruit'],
            MilkTea: [],
            Shakes: ['Fruit', 'Others'],
            Water: []
        },
        snacks: {
            Streetfood: [],
            Pasta: ['Noodles', 'Western Pasta', 'Pancit'],
            Bread: ['Sandwich', 'Sweets']
        }
    };

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const category = button.id;
            if (selectedCategories.has(category)) {
                selectedCategories.delete(category);
                button.classList.remove('btn-selected');
            } else {
                if (selectedCategories.size < 2) {
                    selectedCategories.add(category);
                    button.classList.add('btn-selected');
                } else {
                    alert('You can only select two categories. Click a button to unselect.');
                    return;
                }
            }
            updateSelectedSection();
        });
    });


    function updateSelectedSection() {
        const selectedSection = document.getElementById('selected-section');
        selectedSection.innerHTML = '';
        selectedCategories.forEach(category => {
            const sectionWrapper = document.createElement('div');
            sectionWrapper.classList.add('category-section');
            sectionWrapper.innerHTML = `
                <h4>${category.charAt(0).toUpperCase() + category.slice(1)}</h4>
                <div id="${category}-area"></div>
                <div id="${category}-sub-area"></div>
            `;
            selectedSection.appendChild(sectionWrapper);

            const area = document.getElementById(`${category}-area`);
            const label = document.createElement('p');
            label.classList.add('subcategory-label');
            label.textContent = '';
            area.appendChild(label);

            fetch(`/select/get-categories?category=${category}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Failed to fetch ${category} categories`);
                    }
                    return response.json();
                }).then(data => {
                    console.log(`${category} types: `, data);

                    data.forEach(option => {
                        const button = document.createElement('button');
                        button.classList.add('btn', 'btn-option');
                        button.id = `${category}-${option.id}`;
                        button.textContent = option.name;
                        button.onclick = () => updateOptions(category, option);
                        area.appendChild(button);
                    })
                }).catch(error => {
                    console.log('Error fetching ', category, ' types: ', error);
                })

        });

        // Add the submit button after generating the content
        addSubmitButton();
    }

    function addSubmitButton() {
        const buttonContainer = document.querySelector('.button-container1');
        buttonContainer.innerHTML = '';

        const submitButton = document.createElement('button');
        submitButton.classList.add('submit-btn');
        submitButton.textContent = 'Submit';
        submitButton.onclick = handleFormSubmission; // form submission
        buttonContainer.appendChild(submitButton);
    }

    function updateOptions(category, subCategory) {
        console.log(category, subCategory.id, subCategory.name)
        const subcategoryArea = document.getElementById(`${category}-sub-area`);
        subcategoryArea.innerHTML = '';

        const buttons = document.querySelectorAll(`#${category}-area .btn-option`);
        buttons.forEach(button => button.classList.remove('btn-c-selected'));
        document.getElementById(`${category}-${subCategory.id}`).classList.add('btn-c-selected');


        fetch(`/select/get-sub-categories?category=${category}&categoryId=${subCategory.id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Failed to fetch ${category} sub-categories`);
                }
                return response.json();
            }).then(data => {
                console.log(`${category} sub-categories: `, data);
                // Update UI with fetched sub-categories data
                if (data.length > 0) {
                    const label = document.createElement('p');
                    label.classList.add('subcategory-label');
                    label.textContent = `Select your preferences for ${subCategory.name}:`;
                    subcategoryArea.appendChild(label);

                    data.forEach(subOption => {
                        const button = document.createElement('button');
                        button.classList.add('btn', 'btn-sub-option');
                        button.textContent = subOption.name;

                        button.onclick = () => {
                            const subButtons = document.querySelectorAll(`#${category}-sub-area .btn-sub-option`);
                            subButtons.forEach(subBtn => subBtn.classList.remove('btn-sub-selected'));
                            button.classList.add('btn-sub-selected');
                            // updateSubcategoryDisplay(category, subCategory.name, subOption);
                        };
                        subcategoryArea.appendChild(button);
                    })
                } else {
                    const noSubcategoriesMsg = document.createElement('p');
                    noSubcategoriesMsg.classList.add('no-subcategories');
                    noSubcategoriesMsg.textContent = `No further selection available for ${subCategory.name}.`;
                    subcategoryArea.appendChild(noSubcategoriesMsg);
                }

            })
            .catch(error => {
                console.error(`Error fetching ${category} sub-categories: `, error);
            });
    }

    function updateSubcategoryDisplay(category, option, subOption) {
        const subcategoryDisplay = document.getElementById('subcategory-display');
        const existingItem = document.getElementById(`${category}-${option.id}-${subOption.id}`);
        if (existingItem) {
            existingItem.remove();
        } else {
            const item = document.createElement('div');
            item.id = `${category}-${optionid}-${subOption.id}`;
            item.textContent = subOption.name;
            subcategoryDisplay.appendChild(item);
        }
    }

    function handleFormSubmission() {
        // Add your form submission logic here
        console.log('Form submitted!');
    }
});

$(document).ready(function () {
    const buttons = $('.buttonselect button');

    // Smooth scroll function
    function scrollToSection(sectionId) {
        const section = document.getElementById(sectionId);
        if (section) {
            const navbarHeight = document.querySelector('.navbar').offsetHeight;
            const sectionTop = section.getBoundingClientRect().top + window.scrollY;
            const sectionPosition = sectionTop - navbarHeight;

            window.scrollTo({
                top: sectionPosition,
                behavior: 'smooth'
            });
        }
    }

    $('.scroll-to-section').click(function (e) {
        e.preventDefault();
        const sectionId = $(this).attr('href').substr(1);
        scrollToSection(sectionId);
    });
});
