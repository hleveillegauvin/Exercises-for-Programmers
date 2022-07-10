// Exercises for Programmers
// 10 - Self - Checkout
// Written by : Hubert Léveillé Gauvin
// Date : 10 July 2022

// Create a simple self - checkout system.Prompt for the pricesand quantities of three items.Calculate the tax using a tax rate of 5.5 % .Print out the line itmes with the quantity and total, and then print out the subtotal, tax amount, and total.


#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include < algorithm >

using namespace std;


//Class
class inventoryItems {
public:
    string code;
    string name;
    float price;
};

class purchasedItems: public inventoryItems {
public:
    int quantity;

    float subtotal() {
        return price * quantity;
    }
};


//Function Declaration
float returnItemSubTotal(vector<purchasedItems*> cart);
int returnInventoryVectorIndex(vector<inventoryItems*> inventory, string productCode);
int entireStringIsANumber(string inputString);

//Main
int main()

{


   
    vector<inventoryItems*> inventory;
    
    //Create inventory
    inventory.push_back(new inventoryItems);
    inventory[0]->code = "001";
    inventory[0]->name = "Corn Flakes Cereal";
    inventory[0]->price = 3.99;

    inventory.push_back(new inventoryItems);
    inventory[1]->code = "002";
    inventory[1]->name = "Corn Pop Cereal";
    inventory[1]->price = 4.99;

    inventory.push_back(new inventoryItems);
    inventory[2]->code = "003";
    inventory[2]->name = "2% Milk 2L";
    inventory[2]->price = 4.99;


    vector<purchasedItems*> cart;
    

    int itemNumber = 0;
    float salesTax = 0.055;
    bool checkOut = false;
    string answerToFirstQuestion;
    int inventoryVectorIndex;

    cart.push_back(new purchasedItems);
    cart[itemNumber]->price = 0;
    cart[itemNumber]->quantity = 1;


    while (checkOut == false) {
        itemNumber++;
        cout << "Enter the product code of item " << itemNumber << " or press 'C' to checkout: ";
        cin >> answerToFirstQuestion;
        if (answerToFirstQuestion == "C") {
            checkOut = true;
            itemNumber--; //no item were added to cart
            break;

        }

        
        inventoryVectorIndex = returnInventoryVectorIndex(inventory, answerToFirstQuestion);

        if (inventoryVectorIndex == 99999) {  // if error
            cout << "Can't find this product code in inventory. Please try again." << endl;
            itemNumber--; //no item were added to cart
            continue;
        } 


            cart.push_back(new purchasedItems);
            
            cart[itemNumber]->code = inventory[inventoryVectorIndex]->code;
            cart[itemNumber]->price = inventory[inventoryVectorIndex]->price;
            cart[itemNumber]->name = inventory[inventoryVectorIndex]->name;

            cout << "\t" << cart[itemNumber]->code << "\t" << cart[itemNumber]->name << endl;
            
            std::ostringstream ss;
            ss << "Enter the quantity of item " << itemNumber << ": ";
            std::string quantityPrompt = ss.str();

            cart[itemNumber]->quantity = entireStringIsANumber(quantityPrompt);
            cout << "\t" << cart[itemNumber]->quantity << "\t*\t$ " << cart[itemNumber]->price << "\t\t" << cart[itemNumber]->subtotal() << endl;
    }


    
    float subTotal = returnItemSubTotal(cart);
    float taxTotal = floor((subTotal * salesTax)*100+0.5)/100;
    float total = subTotal + taxTotal;

    cout << "Subtotal: " << subTotal << endl;
    cout << "Tax: " << taxTotal << endl;
    cout << "Total: " << total << endl;
    return 0;
}

// this is more robust than simply testing if input is integer, because cin will let the user input things like "2-1", but will then truncate everything starting with "-"
int entireStringIsANumber(string prompt) {
    string inputString;
    auto is_digit_check = [](unsigned char c) { return std::isdigit(c); };
    while (std::cout << prompt && !(std::cin >> inputString) ||
        !std::all_of(inputString.begin(), inputString.end(), is_digit_check))
    {
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        std::cout << "Invalid input; please re-enter.\n";
    }

    return stoi(inputString);
}



//Function Definition
float returnItemSubTotal(vector<purchasedItems*> cart) {

    float subtotal = 0;
    
    for (std::vector<purchasedItems*>::size_type i = 0; i != cart.size(); i++) {
        subtotal = subtotal + cart[i]->subtotal();
    }

    return subtotal;
}


int returnInventoryVectorIndex(vector<inventoryItems*> inventory, string productCode){
    for (std::vector<inventoryItems* >::size_type i = 0; i != inventory.size(); i++) {

        if (productCode == inventory[i]->code) {
            return i;
            exit;
        }
    }
    return 99999; // product code not found in inventory
}
