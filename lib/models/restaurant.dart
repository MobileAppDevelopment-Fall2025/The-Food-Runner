import 'package:flutter/material.dart';
import 'package:the_food_runner/models/food.dart';

class Restaurant extends ChangeNotifier {
  Map<String, dynamic> allFood = {
    "viet": [
      Food(
        name: "Pho Bo (Beef Noodle Soup)",
        description:
            "Tender beef, rice noodles, and fragrant herbs in a rich, aromatic broth.",
        imagePath: "lib/images/Vietnamese/pho_bo.png",
        price: 12.95,
      ),
      Food(
        name: "Goi Cuon (Summer Rolls)",
        description:
            "Fresh rice paper rolls filled with shrimp, pork, vermicelli, and crisp vegetables.",
        imagePath: "lib/images/Vietnamese/goi_cuon.png",
        price: 8.95,
      ),
      Food(
        name: "Bun Cha (Grilled Pork with Noodles)",
        description:
            "Chargrilled pork patties and sliced pork belly served with rice vermicelli, herbs, and a tangy dipping sauce.",
        imagePath: "lib/images/Vietnamese/bun_cha.png",
        price: 14.95,
      ),
      Food(
        name: "Banh Mi (Vietnamese Sandwich)",
        description:
            "A crusty baguette filled with a combination of pâté, cured meats, pickled vegetables, and fresh herbs.",
        imagePath: "lib/images/Vietnamese/banh_mi.png",
        price: 9.95,
      ),
      Food(
        name: "Che (Vietnamese Dessert)",
        description:
            "A sweet and creamy coconut-based pudding with tapioca pearls, mung beans, and tropical fruits.",
        imagePath: "lib/images/Vietnamese/che.png",
        price: 6.95,
      ),
    ],
    "korean": [
      Food(
        name: "Bulgogi (Marinated Beef)",
        description:
            "Thinly sliced beef marinated in a sweet and savory sauce, grilled to perfection.",
        imagePath: "lib/images/Korean/bulgogi.png",
        price: 18.95,
      ),
      Food(
        name: "Kimchi Fried Rice",
        description:
            "Spicy fermented cabbage combined with rice, vegetables, and a fried egg",
        imagePath: "lib/images/Korean/kimchi_fried_rice.png",
        price: 12.95,
      ),
      Food(
        name: "Japchae",
        description:
            "Chewy sweet potato noodles stir-fried with vegetables, beef, and a sweet soy sauce.",
        imagePath: "lib/images/Korean/japchae.png",
        price: 14.95,
      ),
      Food(
        name: "Galbi (Grilled Short Ribs)",
        description:
            "Tender, marinated short ribs grilled tableside and served with ssamjang (dipping sauce).",
        imagePath: "lib/images/Korean/galbi.png",
        price: 24.95,
      ),
      Food(
        name: "Tteokbokki",
        description:
            "Chewy rice cakes simmered in a spicy, gochujang-based sauce with fish cakes and scallions",
        imagePath: "lib/images/Korean/tteokbokki.png",
        price: 11.95,
      ),
    ],
    "spanish": [
      Food(
        name: "Paella Valenciana",
        description:
            "A classic Spanish dish of saffron-infused rice with shrimp, chicken, and vegetables.",
        imagePath: "lib/images/Spanish/paella_valenciana.png",
        price: 22.95,
      ),
      Food(
        name: "Gazpacho",
        description:
            "A chilled tomato-based soup, bursting with fresh, vibrant flavors.",
        imagePath: "lib/images/Spanish/gazpacho.png",
        price: 8.95,
      ),
      Food(
        name: "Patatas Bravas",
        description:
            "Crispy fried potatoes served with a spicy tomato sauce and aioli.",
        imagePath: "lib/images/Spanish/patatas_bravas.png",
        price: 9.95,
      ),
      Food(
        name: "Gambas al Ajillo",
        description:
            "Shrimp sautéed in garlic-infused olive oil, with a sprinkle of red pepper flakes.",
        imagePath: "lib/images/Spanish/gambas_al_ajillo.png",
        price: 16.95,
      ),
      Food(
        name: "Crema Catalana",
        description:
            "A rich, creamy custard dessert with a caramelized sugar topping.",
        imagePath: "lib/images/Spanish/crema_catalana.png",
        price: 7.95,
      ),
    ],
    "italian": [
      Food(
        name: "Margherita Pizza",
        description:
            "A classic Neapolitan pizza with tomato sauce, fresh mozzarella, and basil.",
        imagePath: "lib/images/Italian/margherita_pizza.png",
        price: 12.95,
      ),
      Food(
        name: "Spaghetti Carbonara",
        description:
            "Pasta tossed with eggs, pancetta, Parmesan, and black pepper.",
        imagePath: "lib/images/Italian/spaghetti_carbonara.png",
        price: 14.95,
      ),
      Food(
        name: "Lasagna",
        description:
            "Layers of pasta, ground beef, ricotta, and a rich tomato sauce, baked to perfection.",
        imagePath: "lib/images/Italian/lasagna.png",
        price: 16.95,
      ),
      Food(
        name: "Caprese Salad",
        description:
            "Sliced tomatoes, fresh mozzarella, basil, and a drizzle of balsamic reduction.",
        imagePath: "lib/images/Italian/caprese_salad.png",
        price: 10.95,
      ),
      Food(
        name: "Tiramisu",
        description:
            "A decadent Italian dessert of ladyfingers soaked in coffee, layered with mascarpone and dusted with cocoa.",
        imagePath: "lib/images/Italian/tiramisu.png",
        price: 8.95,
      ),
    ],
    "american": [
      Food(
        name: "Cheeseburger",
        description:
            "A juicy beef patty topped with melted cheese, lettuce, tomato, onion, and condiments, served on a brioche bun.",
        imagePath: "lib/images/American/cheeseburger.png",
        price: 12.95,
      ),
      Food(
        name: "Mac and Cheese",
        description:
            "Creamy, indulgent macaroni and cheese, baked to a golden brown crust.",
        imagePath: "lib/images/American/mac_and_cheese.png",
        price: 9.95,
      ),
      Food(
        name: "BBQ Ribs",
        description:
            "Tender, fall-off-the-bone pork ribs, smothered in a tangy, smoky barbecue sauce.",
        imagePath: "lib/images/American/bbq_ribs.png",
        price: 18.95,
      ),
      Food(
        name: "Cobb Salad",
        description:
            "A composed salad with grilled chicken, bacon, avocado, hard-boiled egg, and various other toppings.",
        imagePath: "lib/images/American/cobb_salad.png",
        price: 13.95,
      ),
      Food(
        name: "Apple Pie",
        description:
            "A classic American dessert with a flaky crust and a sweet, cinnamon-spiced apple filling.",
        imagePath: "lib/images/American/apple_pie.png",
        price: 6.95,
      ),
    ],
    "japanese": [
      Food(
        name: "Sushi Platter",
        description:
            "Assorted nigiri and maki rolls with fresh fish and seasoned rice.",
        imagePath: "lib/images/Japanese/sushi_platter.png",
        price: 22.95,
      ),
      Food(
        name: "Ramen",
        description:
            "Rich pork broth with chewy noodles, chashu, soft-boiled egg, and scallions.",
        imagePath: "lib/images/Japanese/ramen.png",
        price: 14.95,
      ),
      Food(
        name: "Tempura Udon",
        description:
            "Thick wheat noodles in savory broth, topped with crispy shrimp tempura.",
        imagePath: "lib/images/Japanese/tempura_udon.png",
        price: 15.95,
      ),
      Food(
        name: "Chicken Teriyaki",
        description:
            "Grilled chicken glazed with sweet teriyaki sauce, served with rice and vegetables.",
        imagePath: "lib/images/Japanese/chicken_teriyaki.png",
        price: 16.95,
      ),
      Food(
        name: "Matcha Cheesecake",
        description:
            "Creamy cheesecake infused with earthy matcha, on a buttery biscuit base.",
        imagePath: "lib/images/Japanese/matcha_cheesecake.png",
        price: 8.95,
      ),
    ],
    "mexican": [
      Food(
        name: "Tacos al Pastor",
        description:
            "Marinated pork shaved from the spit, served on corn tortillas with pineapple and cilantro.",
        imagePath: "lib/images/Mexican/tacos_al_pastor.png",
        price: 12.95,
      ),
      Food(
        name: "Chicken Enchiladas",
        description:
            "Corn tortillas stuffed with chicken, smothered in red enchilada sauce and cheese.",
        imagePath: "lib/images/Mexican/chicken_enchiladas.png",
        price: 13.95,
      ),
      Food(
        name: "Guacamole & Chips",
        description:
            "Creamy avocado dip with lime and cilantro, served with crispy tortilla chips.",
        imagePath: "lib/images/Mexican/guacamole.png",
        price: 8.95,
      ),
      Food(
        name: "Carne Asada Burrito",
        description:
            "Grilled steak wrapped with rice, beans, pico de gallo, and cheese.",
        imagePath: "lib/images/Mexican/carne_asada_burrito.png",
        price: 11.95,
      ),
      Food(
        name: "Churros",
        description:
            "Crispy cinnamon-sugar pastry sticks with warm chocolate dipping sauce.",
        imagePath: "lib/images/Mexican/churros.png",
        price: 6.95,
      ),
    ],
    "indian": [
      Food(
        name: "Butter Chicken",
        description:
            "Tender chicken simmered in a creamy tomato-butter sauce, served with basmati rice.",
        imagePath: "lib/images/Indian/butter_chicken.png",
        price: 15.95,
      ),
      Food(
        name: "Palak Paneer",
        description:
            "Cubes of paneer in a smooth spinach gravy with aromatic spices.",
        imagePath: "lib/images/Indian/palak_paneer.png",
        price: 13.95,
      ),
      Food(
        name: "Chicken Biryani",
        description:
            "Fragrant spiced rice layered with marinated chicken, garnished with fried onions and herbs.",
        imagePath: "lib/images/Indian/chicken_biryani.png",
        price: 16.95,
      ),
      Food(
        name: "Samosas",
        description:
            "Crispy pastry pockets filled with spiced potatoes and peas, served with chutney.",
        imagePath: "lib/images/Indian/samosas.png",
        price: 7.95,
      ),
      Food(
        name: "Gulab Jamun",
        description:
            "Soft milk-solid dumplings soaked in cardamom-scented sugar syrup.",
        imagePath: "lib/images/Indian/gulab_jamun.png",
        price: 6.95,
      ),
    ],
    "thai": [
      Food(
        name: "Pad Thai",
        description:
            "Stir-fried rice noodles with tamarind sauce, shrimp, egg, and peanuts.",
        imagePath: "lib/images/Thai/pad_thai.png",
        price: 13.95,
      ),
      Food(
        name: "Green Curry",
        description:
            "Spicy coconut curry with chicken, eggplant, bamboo shoots, and Thai basil.",
        imagePath: "lib/images/Thai/green_curry.png",
        price: 14.95,
      ),
      Food(
        name: "Tom Yum Soup",
        description:
            "Hot and sour broth with shrimp, lemongrass, kaffir lime leaves, and mushrooms.",
        imagePath: "lib/images/Thai/tom_yum.png",
        price: 10.95,
      ),
      Food(
        name: "Pineapple Fried Rice",
        description:
            "Savory-sweet fried rice with pineapple, cashews, shrimp, and curry powder.",
        imagePath: "lib/images/Thai/pineapple_fried_rice.png",
        price: 12.95,
      ),
      Food(
        name: "Mango Sticky Rice",
        description:
            "Sweet sticky rice served with ripe mango and coconut cream.",
        imagePath: "lib/images/Thai/mango_sticky_rice.png",
        price: 7.95,
      ),
    ],
    "french": [
      Food(
        name: "Croque Monsieur",
        description:
            "Grilled ham and Emmental sandwich topped with béchamel and baked.",
        imagePath: "lib/images/French/croque_monsieur.png",
        price: 12.95,
      ),
      Food(
        name: "Coq au Vin",
        description:
            "Chicken braised in red wine with mushrooms, lardons, and aromatics.",
        imagePath: "lib/images/French/coq_au_vin.png",
        price: 19.95,
      ),
      Food(
        name: "Ratatouille",
        description:
            "Provencal stewed vegetables with tomato, eggplant, zucchini, and herbs de Provence.",
        imagePath: "lib/images/French/ratatouille.png",
        price: 13.95,
      ),
      Food(
        name: "Steak Frites",
        description: "Seared steak served with crispy fries and herb butter.",
        imagePath: "lib/images/French/steak_frites.png",
        price: 21.95,
      ),
      Food(
        name: "Crème Brûlée",
        description:
            "Silky vanilla custard topped with a caramelized sugar crust.",
        imagePath: "lib/images/French/creme_brulee.png",
        price: 8.95,
      ),
    ],
  };
}
