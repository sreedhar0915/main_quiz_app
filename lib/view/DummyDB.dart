class Dummydb {
  static List categorylist = [
    {
      "categoryname": "Sports",
      "categoryimage": "Assets/images/sports-removebg-preview.png",
    },
    {
      "categoryname": "Chemistry",
      "categoryimage": "Assets/images/chemistry-removebg-preview.png",
    },
    {
      "categoryname": "Mathematics",
      "categoryimage": "Assets/images/maths-removebg-preview.png",
    },
    {
      "categoryname": "History",
      "categoryimage": "Assets/images/history-removebg-preview.png",
    },
    {
      "categoryname": "Biology",
      "categoryimage": "Assets/images/biological-removebg-preview.png",
    },
    {
      "categoryname": "Geography",
      "categoryimage": "Assets/images/geography-removebg-preview.png",
    }
  ];
  static List<Map<String, dynamic>> Sportslist = [
    {
      "questions": "What is the national sport of Canada?",
      "options": ["Hockey", "Lacrosse", "Basketball", "Soccer"],
      "answerindex": 1
    },
    {
      "questions": "Which country hosted the 2016 Summer Olympics?",
      "options": ["China", "Brazil", "Russia", "Japan"],
      "answerindex": 1
    },
    {
      "questions": "In which sport is the term 'home run' used?",
      "options": ["Baseball", "Football", "Golf", "Cricket"],
      "answerindex": 0
    },
    {
      "questions": "What is the highest governing body for football (soccer)?",
      "options": ["FIFA", "UEFA", "CONCACAF", "NCAA"],
      "answerindex": 0
    },
    {
      "questions": "Which sport is known as the 'king of sports'?",
      "options": ["Basketball", "Football", "Tennis", "Rugby"],
      "answerindex": 1
    },
    {
      "questions": "Who has won the most Grand Slam titles in tennis?",
      "options": [
        "Roger Federer",
        "Serena Williams",
        "Rafael Nadal",
        "Novak Djokovic"
      ],
      "answerindex": 3
    },
    {
      "questions": "In which sport would you perform a slam dunk?",
      "options": ["Basketball", "Volleyball", "Hockey", "Badminton"],
      "answerindex": 0
    },
    {
      "questions": "What is the length of an Olympic swimming pool?",
      "options": ["25 meters", "50 meters", "100 meters", "75 meters"],
      "answerindex": 1
    },
    {
      "questions":
          "Which country is known for originating the sport of cricket?",
      "options": ["Australia", "India", "England", "South Africa"],
      "answerindex": 2
    },
    {
      "questions": "What is the term for a score of zero in tennis?",
      "options": ["Love", "Nil", "Zero", "Nothing"],
      "answerindex": 0
    },
  ];
  static List<Map<String, dynamic>> ChemistryList = [
    {
      "questions": "What is the chemical symbol for water?",
      "options": ["H2O", "O2", "CO2", "HO"],
      "answerindex": 0
    },
    {
      "questions": "Which element has the atomic number 1?",
      "options": ["Helium", "Oxygen", "Hydrogen", "Lithium"],
      "answerindex": 2
    },
    {
      "questions": "What is the pH level of pure water?",
      "options": ["0", "7", "14", "10"],
      "answerindex": 1
    },
    {
      "questions": "What is the most abundant gas in the Earth's atmosphere?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "answerindex": 2
    },
    {
      "questions": "Which acid is known as 'king of chemicals'?",
      "options": [
        "Sulfuric acid",
        "Hydrochloric acid",
        "Nitric acid",
        "Acetic acid"
      ],
      "answerindex": 0
    },
    {
      "questions":
          "What is the term for a substance that increases the rate of a chemical reaction?",
      "options": ["Catalyst", "Reagent", "Solvent", "Substrate"],
      "answerindex": 0
    },
    {
      "questions": "Which element is represented by the symbol 'Na'?",
      "options": ["Sodium", "Nitrogen", "Neon", "Nickel"],
      "answerindex": 0
    },
    {
      "questions":
          "What is the main gas produced by the combustion of fossil fuels?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Methane"],
      "answerindex": 1
    },
    {
      "questions":
          "What type of bond involves the sharing of electron pairs between atoms?",
      "options": [
        "Ionic bond",
        "Covalent bond",
        "Metallic bond",
        "Hydrogen bond"
      ],
      "answerindex": 1
    },
    {
      "questions": "Which of the following is a noble gas?",
      "options": ["Argon", "Oxygen", "Hydrogen", "Nitrogen"],
      "answerindex": 0
    },
  ];
  static List<Map<String, dynamic>> MathematicsList = [
    {
      "questions": "What is the value of π (pi) to two decimal places?",
      "options": ["3.12", "3.14", "3.16", "3.18"],
      "answerindex": 1
    },
    {
      "questions": "What is the square root of 144?",
      "options": ["10", "12", "14", "16"],
      "answerindex": 1
    },
    {
      "questions": "What is 7 times 8?",
      "options": ["54", "56", "58", "60"],
      "answerindex": 1
    },
    {
      "questions": "What is the derivative of x²?",
      "options": ["1", "2x", "x", "x²"],
      "answerindex": 1
    },
    {
      "questions": "What is the value of the angle sum in a triangle?",
      "options": ["90 degrees", "180 degrees", "360 degrees", "270 degrees"],
      "answerindex": 1
    },
    {
      "questions": "What is the area of a circle with a radius of 3?",
      "options": ["9π", "6π", "12π", "3π"],
      "answerindex": 0
    },
    {
      "questions": "What is the formula for the circumference of a circle?",
      "options": ["πd", "2πr", "πr²", "4r"],
      "answerindex": 1
    },
    {
      "questions": "What is 15% of 200?",
      "options": ["20", "25", "30", "35"],
      "answerindex": 2
    },
    {
      "questions":
          "What is the mode of the following set of numbers: 3, 7, 7, 2, 5?",
      "options": ["3", "5", "7", "2"],
      "answerindex": 2
    },
    {
      "questions": "What is the next prime number after 7?",
      "options": ["8", "9", "10", "11"],
      "answerindex": 3
    },
  ];
  static List<Map<String, dynamic>> HistoryList = [
    {
      "questions": "Who was the first President of the United States?",
      "options": [
        "George Washington",
        "Thomas Jefferson",
        "Abraham Lincoln",
        "John Adams"
      ],
      "answerindex": 0
    },
    {
      "questions": "What year did World War II begin?",
      "options": ["1935", "1939", "1941", "1945"],
      "answerindex": 1
    },
    {
      "questions": "Which ancient civilization built the pyramids?",
      "options": ["Greek", "Roman", "Egyptian", "Mesopotamian"],
      "answerindex": 2
    },
    {
      "questions": "What was the main cause of the Cold War?",
      "options": [
        "Economic differences",
        "Cultural differences",
        "Political differences",
        "Technological differences"
      ],
      "answerindex": 2
    },
    {
      "questions": "Who wrote the Declaration of Independence?",
      "options": [
        "George Washington",
        "Benjamin Franklin",
        "Thomas Jefferson",
        "John Adams"
      ],
      "answerindex": 2
    },
    {
      "questions": "What was the name of the ship that sank in 1912?",
      "options": ["Britannic", "Lusitania", "Titanic", "Olympic"],
      "answerindex": 2
    },
    {
      "questions": "Which empire was known for its extensive road system?",
      "options": [
        "Roman Empire",
        "Mongol Empire",
        "Ottoman Empire",
        "British Empire"
      ],
      "answerindex": 0
    },
    {
      "questions": "What event triggered the French Revolution?",
      "options": [
        "Storming of the Bastille",
        "Execution of Louis XVI",
        "Establishment of the National Assembly",
        "Declaration of the Rights of Man"
      ],
      "answerindex": 0
    },
    {
      "questions": "Who was the famous female pharaoh of ancient Egypt?",
      "options": ["Cleopatra", "Nefertiti", "Hatshepsut", "Isis"],
      "answerindex": 2
    },
    {
      "questions":
          "Which war was fought between the North and South regions in the United States?",
      "options": [
        "World War I",
        "World War II",
        "Civil War",
        "Revolutionary War"
      ],
      "answerindex": 2
    },
  ];
  static List<Map<String, dynamic>> BiologyList = [
    {
      "questions": "What is the basic unit of life?",
      "options": ["Tissue", "Organ", "Cell", "Organism"],
      "answerindex": 2
    },
    {
      "questions": "What is the powerhouse of the cell?",
      "options": [
        "Nucleus",
        "Ribosome",
        "Mitochondria",
        "Endoplasmic Reticulum"
      ],
      "answerindex": 2
    },
    {
      "questions": "Which molecule carries genetic information?",
      "options": ["RNA", "DNA", "Proteins", "Lipids"],
      "answerindex": 1
    },
    {
      "questions":
          "What process do plants use to convert sunlight into energy?",
      "options": ["Photosynthesis", "Respiration", "Fermentation", "Digestion"],
      "answerindex": 0
    },
    {
      "questions": "What is the study of ecosystems called?",
      "options": ["Ecology", "Biology", "Zoology", "Botany"],
      "answerindex": 0
    },
    {
      "questions":
          "Which organ is responsible for pumping blood throughout the body?",
      "options": ["Liver", "Lungs", "Heart", "Kidneys"],
      "answerindex": 2
    },
    {
      "questions":
          "What is the term for the variety of life in the world or in a particular habitat?",
      "options": ["Biodiversity", "Population", "Species", "Ecosystem"],
      "answerindex": 0
    },
    {
      "questions": "What is the main function of red blood cells?",
      "options": [
        "Transport nutrients",
        "Fight infection",
        "Carry oxygen",
        "Remove waste"
      ],
      "answerindex": 2
    },
    {
      "questions": "Which vitamin is primarily obtained from sunlight?",
      "options": ["Vitamin A", "Vitamin B12", "Vitamin C", "Vitamin D"],
      "answerindex": 3
    },
    {
      "questions": "What is the largest organ in the human body?",
      "options": ["Heart", "Liver", "Skin", "Lungs"],
      "answerindex": 2
    },
  ];
  static List<Map<String, dynamic>> GeographyList = [
    {
      "questions": "What is the largest continent on Earth?",
      "options": ["Africa", "Asia", "North America", "South America"],
      "answerindex": 1
    },
    {
      "questions": "Which river is the longest in the world?",
      "options": ["Amazon", "Nile", "Yangtze", "Mississippi"],
      "answerindex": 1
    },
    {
      "questions": "What is the capital city of Japan?",
      "options": ["Beijing", "Seoul", "Tokyo", "Bangkok"],
      "answerindex": 2
    },
    {
      "questions": "Which country is known as the Land of the Rising Sun?",
      "options": ["China", "Japan", "Thailand", "India"],
      "answerindex": 1
    },
    {
      "questions": "What is the smallest country in the world?",
      "options": ["Monaco", "Nauru", "Vatican City", "San Marino"],
      "answerindex": 2
    },
    {
      "questions": "Which mountain range separates Europe and Asia?",
      "options": ["Andes", "Himalayas", "Ural Mountains", "Rocky Mountains"],
      "answerindex": 2
    },
    {
      "questions": "What is the capital of Australia?",
      "options": ["Sydney", "Canberra", "Melbourne", "Brisbane"],
      "answerindex": 1
    },
    {
      "questions": "Which ocean is the largest?",
      "options": [
        "Atlantic Ocean",
        "Indian Ocean",
        "Arctic Ocean",
        "Pacific Ocean"
      ],
      "answerindex": 3
    },
    {
      "questions": "What is the most populous country in the world?",
      "options": ["India", "United States", "China", "Indonesia"],
      "answerindex": 2
    },
    {
      "questions": "Which desert is the largest in the world?",
      "options": ["Sahara", "Gobi", "Kalahari", "Arabian"],
      "answerindex": 0
    },
  ];
}
