# Goddybrilliant-Pizza-Hub-Webpage

# Project Overview
This is an *ASP.NET Web Forms* application that allows customers to order pizza online during the Friday promo. Customers can select a pizza size, add a topping for only R2, choose a crust type, and optionally add a tip for delivery. The system calculates the total cost, validates all inputs, and displays a clean order confirmation.
This project was developed as part of a university practical assignment to demonstrate *postbacks, radio buttons, custom validators, AutoPostBack, and CSS styling*.

# Features
- *Customer details* – name and email (with validation)
- *Pizza size selection* – Small (R35), Medium (R50), Large (R80) using radio buttons
- *Topping selection* – dropdown list with six options (extra R2)
- *Crust type* – Thin (R5) or Thick (R8) using radio buttons
- *Tip option* – checkbox with `AutoPostBack` that reveals a textbox for tip amount (R1 – R100)
- *Order summary* – displays customer name, size, crust, topping, total cost, and tip (if any)
- *Validation* – required fields, email format, tip range, and custom validators for radio button groups
- *Clear button* – resets all fields and hides the summary
- *Responsive CSS* – cyan & black theme with button hover effects

# Technologies Used
- ASP.NET Web Forms (.NET Framework 4.7.2) - Backend logic & server controls 
- C# - Code‑behind event handling 
- HTML5 / CSS3 - Structure and styling 
- Visual Studio 2019 / 2022 - Development environment 

#Project Structure
├── Default.aspx # Web form markup (controls, validators, layout)
├── Default.aspx.cs # Code‑behind (event handlers, calculations)
├── Styles.css # Cyan & black theme, button hover effects
└── README.md # This file


# How to Run the Application

1. *Clone the repository* 
   ```bash
   git clone https://github.com/ddybrilliant23.git

Open in Visual Studio

    Open the .sln file or the project folder.
    Ensure .NET Framework 4.7.2 or higher is installed.

Build the solution

    Press Ctrl + Shift + B.

Run the application

    Set Default.aspx as the start page.
    Press F5 to run with debugging, or Ctrl + F5 without debugging.

Place an order

    Fill in your name and email.
    Select a pizza size, a topping, and a crust type.
    (Optional) Tick “Add a tip” and enter an amount.
    Click Place Order – the confirmation will appear below the form.

# Validation Rules

Field         | Validator                                          | Rule
--------------|----------------------------------------------------|----------------------------------------
Name          | RequiredFieldValidator                             | Must not be empty
Email         | RequiredFieldValidator + RegularExpressionValidator | Not empty + valid email format
Pizza Size    | CustomValidator                                    | At least one size selected
Topping       | RequiredFieldValidator                             | An option must be chosen
Crust Type    | CustomValidator                                    | At least one crust selected
Tip amount    | RangeValidator (enabled only when checkbox ticked) | Between 1 and 100 (R)

# CSS Theme Details

- Background – black (#000000)
- Text & borders – cyan (#00FFFF)
- Buttons – cyan background, black text; on hover → black background, white text, cyan border
- Input fields – black background, cyan text, cyan border
- Validation summary – dark red background with red text for errors
- Order summary – dark grey background with cyan text


# Author
- MNQOBI KHOWANE – [https://github.com/ddybrilliantkhowane23]
- University – North‑West University, South Africa
- Course – CMPG212(Apps and advanced user interface programming)
- Practical – 6 (Postbacks and Radio Buttons)

# License
This project is for educational purposes only. You may use it as a reference for your own assignments.

# Acknowledgements

- Mr Nathan Morgenrood (lecturer) for guidance on ASP.NET Web Forms.
- The pizza hub scenario provided in the practical brief.
