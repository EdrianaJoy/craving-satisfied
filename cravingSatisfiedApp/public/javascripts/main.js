

let categoryForm = {
    categoryName: null,
    type: null,
    subType: null
}

document.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.btn.btn-brand');
    const selectedCategories = new Map();

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const category = button.id;
            console.log('category: ' + category)
            if (selectedCategories.has(category)) {
                selectedCategories.delete(category);
                button.classList.remove('btn-selected');
            } else {
                if (selectedCategories.size < 2) {
                    console.log(selectedCategories.size)
                    selectedCategories.set(category, null);
                    button.classList.add('btn-selected');
                } else {
                    alert('You can only select two categories. Click a button to unselect.');
                    return;
                }
            }

            getCategoryTypes();
        });
    });


    function getCategoryTypes() {
        const selectedSection = document.getElementById('selected-section');
        selectedSection.innerHTML = '';
        selectedCategories.forEach((value, category) => {
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

                    data.forEach(type => {
                        const button = document.createElement('button');
                        button.classList.add('btn', 'btn-option');
                        button.id = `${category}-${type.id}`;
                        button.textContent = type.name;
                        button.onclick = () => getCategorySubTypes(category, type);
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

    function getCategorySubTypes(category, type) {

        const subcategoryArea = document.getElementById(`${category}-sub-area`);
        subcategoryArea.innerHTML = '';

        const buttons = document.querySelectorAll(`#${category}-area .btn-option`);
        buttons.forEach(button => button.classList.remove('btn-c-selected'));
        document.getElementById(`${category}-${type.id}`).classList.add('btn-c-selected');


        fetch(`/select/get-sub-categories?category=${category}&typeId=${type.id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Failed to fetch ${category} sub-categories`);
                }
                return response.json();
            }).then(data => {
                // Update UI with fetched sub-categories data
                if (data.length > 0) {
                    const label = document.createElement('p');
                    label.classList.add('subcategory-label');
                    label.textContent = `Select your preferences for ${type.name}:`;
                    subcategoryArea.appendChild(label);

                    data.forEach(subType => {
                        const button = document.createElement('button');
                        button.classList.add('btn', 'btn-sub-option');
                        button.textContent = subType.name.split('-')[1];
                        button.id = subType.id

                        button.onclick = () => {
                            const subButtons = document.querySelectorAll(`#${category}-sub-area .btn-sub-option`);
                            subButtons.forEach(subBtn => subBtn.classList.remove('btn-sub-selected'));
                            button.classList.add('btn-sub-selected');
                            categoryForm = {
                                categoryName: category,
                                type: type.id,
                                subType: parseInt(button.id)
                            }
                            selectedCategories.set(category, categoryForm);
                            console.log('damassh', selectedCategories);

                        };
                        subcategoryArea.appendChild(button);
                    })
                } else {
                    categoryForm = {
                        categoryName: category,
                        type: type.id,
                        subType: null
                    }
                    selectedCategories.set(category, categoryForm);
                    const noSubcategoriesMsg = document.createElement('p');
                    noSubcategoriesMsg.classList.add('no-subcategories');
                    noSubcategoriesMsg.textContent = `No further selection available for ${type.name}.`;
                    subcategoryArea.appendChild(noSubcategoriesMsg);

                }
            })
            .catch(error => {
                console.error(`Error fetching ${category} sub-categories: `, error);
            });
    }

    function handleFormSubmission() {
        console.log('Form submitted!');
        const budget = document.getElementById('budget').value;

        const categories = [];
        selectedCategories.forEach((value, category) => {
            categories.push(value);
        });

        console.log('selectedCategories', categories);
        const form = {
            budget: budget,
            categories: categories
        }

        fetch('/select/get-meals', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(form)
        }).then(data => {
            console.log(data)
        }).catch(error => {
            console.error('Error', error)
            alert(error);
        });

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
