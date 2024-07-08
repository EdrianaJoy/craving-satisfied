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
                    alert('You can only select two categories. Click button to unselect.');
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

            Object.keys(data[category.replace('-', '_')]).forEach(option => {
                const button = document.createElement('button');
                button.classList.add('btn', 'btn-option');
                button.id = `${category}-${option}`;
                button.textContent = option;
                button.onclick = () => updateOptions(`${category}-${option}`, category);
                area.appendChild(button);
            });
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

    function updateOptions(optionId, category) {
        const subcategoryArea = document.getElementById(`${category}-sub-area`);
        subcategoryArea.innerHTML = '';
        const selectedOption = optionId.split('-')[1];
        const buttons = document.querySelectorAll(`#${category}-area .btn-option`);
    
        buttons.forEach(button => button.classList.remove('btn-c-selected'));
                document.getElementById(optionId).classList.add('btn-c-selected');
        
        if (data[category][selectedOption] && data[category][selectedOption].length > 0) {
            const label = document.createElement('p');
            label.classList.add('subcategory-label');
            label.textContent = `Select your preferences for ${selectedOption}:`;
            subcategoryArea.appendChild(label);

            data[category][selectedOption].forEach(subOption => {
                const button = document.createElement('button');
                button.classList.add('btn', 'btn-sub-option');
                button.textContent = subOption;
                button.onclick = () => {
                    const subButtons = document.querySelectorAll(`#${category}-sub-area .btn-sub-option`);
                    subButtons.forEach(subBtn => subBtn.classList.remove('btn-sub-selected'));
                    button.classList.add('btn-sub-selected');
                    updateSubcategoryDisplay(category, selectedOption, subOption);
                };
                subcategoryArea.appendChild(button);
            });
        } else {
            const noSubcategoriesMsg = document.createElement('p');
            noSubcategoriesMsg.classList.add('no-subcategories');
            noSubcategoriesMsg.textContent = `No further selection available for ${selectedOption}.`;
            subcategoryArea.appendChild(noSubcategoriesMsg);
        }
    }

    function updateSubcategoryDisplay(category, option, subOption) {
        const subcategoryDisplay = document.getElementById('subcategory-display');
        const existingItem = document.getElementById(`${category}-${option}-${subOption}`);
        if (existingItem) {
            existingItem.remove();
        } else {
            const item = document.createElement('div');
            item.id = `${category}-${option}-${subOption}`;
            item.textContent = `${category.charAt(0).toUpperCase() + category.slice(1)} - ${option} - ${subOption}`;
            subcategoryDisplay.appendChild(item);
        }
    }

    function handleFormSubmission() {
        // Add your form submission logic here
        console.log('Form submitted!');
    }
});

$(document).ready(function() {
    const buttons = $('.buttonselect button');

    buttons.click(function() {
        buttons.removeClass('btn-selected');
        $(this).addClass('btn-selected');
    });

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

    $('.scroll-to-section').click(function(e) {
        e.preventDefault();
        const sectionId = $(this).attr('href').substr(1); 
        scrollToSection(sectionId);
    });
});
