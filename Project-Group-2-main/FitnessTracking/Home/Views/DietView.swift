//
//  DietView.swift
//  FitnessTracking
//
//  Created by randy on 11/20/22.
//



import SwiftUI

struct Diet: View {
    let NormalWorkouts = dietNormalData
    let OverweightWorkouts = dietOverweightData
    let UnderweightWorkouts = dietUnderWeightData
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        let StringWeight = sessionService.userDetails?.bmi ?? "N/A"
        let weight = Float(StringWeight) ?? 0
        
        NavigationView {
            VStack {
                ZStack{
                    Image("istockphoto-877317520-612x612")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height:300)
                    //vertical stack
                    
                    VStack{
                        Spacer()
                        Text("Today's Meal Entries")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        
                    }
                    .padding()
                    .frame(width: 380)
                    //.background(Color(UIColor.systemGray))
                }
                .frame(width:380, height:300)
                .cornerRadius(20)
                .shadow(radius: 8)
                .padding(.top, 20)
                .clipped()
                
                
                Text("Meals by Day")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        if weight > 25{
                            ForEach(OverweightWorkouts){ Dietc in
                                // Day card
                                NavigationLink(destination: DietDataEntry(dietD: Dietc)){
                                    ZStack {
                                        Image(Dietc.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(Dietc.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Text("Calorie Count: " + Dietc.calorieCount)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                            
                        }
                        else if weight == 25{
                            ForEach(NormalWorkouts){ Dietb in
                                // Day card
                                NavigationLink(destination: DietDataEntry(dietD: Dietb)){
                                    ZStack {
                                        Image(Dietb.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(Dietb.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Text("Calorie Count: " + Dietb.calorieCount)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                        }
                        else if weight < 25{
                            ForEach(UnderweightWorkouts){ DietE in
                                // Day card
                                NavigationLink(destination: DietDataEntry(dietD: DietE)){
                                    ZStack {
                                        Image(DietE.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 380, height:220)
                                        
                                        VStack{
                                            Spacer()
                                            Text(DietE.day)
                                                .font(.largeTitle)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Text("Calorie Count: " + DietE.calorieCount)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: 380)
                                    }
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                }
                            }
                        }
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle("Meal Plans")
        }
    }


struct Diet_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
struct Diet_entry: Identifiable{
    var id = UUID()
    
    var day: String
    var calorieCount: String
    var image: String
    var breakfast: String
    var lunch: String
    var dinner: String
    var dietsBreakfast: String
    var dietsLunch: String
    var dietsDinner: String
    
}
let dietNormalData = [
    Diet_entry(day: "Monday", calorieCount: "2000", image: "istockphoto-505020568-612x612",breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner" , dietsBreakfast: "Two eggs scrambled, one cup of oatmeal cooked with 2 teaspoons peanut butter, and one bananna sliced", dietsLunch: "Salad: Spinach, tomatoes, cucumbers, shredded carrots, mushrooms, Quinoa, 4 oz grilled chicken, 2 tablespoons salad dressing, 1 cup straberries", dietsDinner: "4 ounces baked chicken breast, 1 cup mashed potatos with 1 tablespoon butter, 2 cups steamed broccoli, 1 cup blueberries"),
    Diet_entry(day: "Tuesday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 egg whites, 1 ounce turkey sausage, 2 slices light whole grain bread, 1 cup mellon, 1 tablespoon light butter spread", dietsLunch: "4 ounces Salmon, 1/2 cup brown rice, 1/2 cup sweet potato, 2 cups of salad, 1 apple, 2 tablespoons humus", dietsDinner: "4 ounces of steak, 1 cup mashed potatoes, 1 cup cooked broccoli, 1 small bannana"),
    Diet_entry(day: "Wednesday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 scrambled eggs, 1 cup of oatmeal, 1/2 cup orange juice", dietsLunch: "3 ounces pulled pork, 1/3 cup hummus, 2 slices whole grain bread, lettuce, tomato, onion, 2 teaspoons mayo, 1 small bananna", dietsDinner: "4 ounces chicken breast, 1 cup whole wheat pasta, 1 cup asparagus, 1 peach"),
    Diet_entry(day: "Thursday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 cups of plain yogurt, 1 cup steel-cut oats, 1 cup berries", dietsLunch: "4 ounces Salmon, 1/2 cup brown rice, 1/2 cup sweet potato, 2 cups of salad, 1 apple, 2 tablespoons humus", dietsDinner: "4 ounces lean burger, 2 slices whole grain bread, 1/2 cup spinach, 1/2 cup tomato, 1 small banana"),
    Diet_entry(day: "Friday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 egg whites, 1 ounce turkey sausage, 2 slices light whole grain bread, 1 cup mellon, 1 tablespoon light butter spread", dietsLunch: "3 ounces pulled pork, 1/3 cup hummus, 2 slices whole grain bread, lettuce, tomato, onion, 2 teaspoons mayo, 1 small bananna", dietsDinner: "4 ounces chicken breast, 1 cup whole wheat pasta, 1 cup asparagus, 1 peach"),
    Diet_entry(day: "Saturday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Two eggs scrambled, one cup of oatmeal cooked with 2 teaspoons peanut butter, and one bananna sliced", dietsLunch: "Salad: Spinach, tomatoes, cucumbers, shredded carrots, mushrooms, Quinoa, 4 oz grilled chicken, 2 tablespoons salad dressing, 1 cup straberries", dietsDinner: "4 ounces baked chicken breast, 1 cup mashed potatos with 1 tablespoon butter, 2 cups steamed broccoli, 1 cup blueberries"),
    Diet_entry(day: "Sunday", calorieCount: "2000", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 egg whites, 1 ounce turkey sausage, 2 slices light whole grain bread, 1 cup mellon, 1 tablespoon light butter spread", dietsLunch: "4 ounces Salmon, 1/2 cup brown rice, 1/2 cup sweet potato, 2 cups of salad, 1 apple, 2 tablespoons humus", dietsDinner: "4 ounces of steak, 1 cup mashed potatoes, 1 cup cooked broccoli, 1 small bannana"),
]

let dietOverweightData = [
    Diet_entry(day: "Monday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "3/4 cup bran flakes, 1 banana and 1 cup fat-free milk in a bowl.", dietsLunch: "1 mini whole wheat pita, 3 ounces turkey breast, 1/2 roasted pepper, 1 teaspoon mayo, mustard and lettuce. Serve with 1 stick part-skim mozzarella string cheese and 2 kiwis.", dietsDinner: "4 ounces broiled flounder or sole with 2 sliced plum tomatoes sprinkled with 2 tablespoons grated Parmesan cheese, broiled until just golden. Eat with 1 cup cooked couscous and 1 cup steamed broccoli."),
    Diet_entry(day: "Tuesday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Blend 1 cup frozen berries, 1/2 banana, and 8 ounces of low- or fat-free milk into a smoothie. Eat with 2 hard boiled eggs", dietsLunch: "1 cup vegetarian vegetable soup and serve with 1 veggie burger on a slice of whole grain and seed toast or an English muffin, 1 cup of fresh grapes.", dietsDinner: "4 ounces boneless, skinless chicken breast with barbecue sauce and grill. Garnish chicken with chopped scallions and a squeeze of lime juice. Combine 2 heaping cups of sautéed spinach with garlic, olive oil and tomatoes and serve with 1/2 plain baked or sweet potato."),
    Diet_entry(day: "Wednesday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "1/2 cup quick-cooking oats with low-fat or unsweetened soy milk. Add 1/2 apple (sliced or chopped), 1 teaspoon honey and a pinch of cinnamon.", dietsLunch: "chicken salad, toss 4 ounces shredded skinless roast chicken breast with 1/4 cup sliced red grapes, 1 tablespoon slivered almonds or nuts of choice, 1/4 cup chopped celery, 1 tablespoon mayonnaise and 1 tablespoon plain, unsweetened Greek yogurt. Serve over lettuce. Eat with 1 large piece of multigrain toast.", dietsDinner:"4 ounces steamed shrimp with 1 baked potato topped with 3 tablespoons salsa and 1 tablespoon unsweetened Greek yogurt, plus 3 cups spinach, steamed."),
    Diet_entry(day: "Thursday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "1 cup of plain or low-sugar Greek yogurt with 1 cup berries of choice and 1/3 cup low-sugar granola to make a simple but delectable yogurt parfait.", dietsLunch: "1 cup tomato soup and serve with a sandwich made with 1 mini whole-wheat pita, 3 ounces thinly sliced roast beef, 1 teaspoon horseradish, mustard, tomato slices and lettuce, 2 cups raw veggies and 1/4 cup of hummus.", dietsDinner:"4 ounces poached salmon with a slaw made by tossing 1 1/4 cups coleslaw mix and 2 sliced scallions with 1 tablespoon of rice vinegar and 1 1/2 teaspoons olive oil. Add spices, herbs and seasoning as desired. Pair with 1 cup of a 100% whole grain, like quinoa."),
    Diet_entry(day: "Friday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "1 cup Cheerios, 1/2 cup berries, 1 tablespoon slivered almonds and 6 ounces plain, unsweetened Greek yogurt in a bowl.", dietsLunch: "quesadilla by spreading 1/4 cup fat-free refried beans over a 100% stone-ground corn tortilla. Sprinkle on 1 ounce shredded part-skim cheese. Top with salsa and another tortilla; microwave 45 seconds on high or grill. Serve with cucumber spears and 1/2 cup 2% cottage cheese or Greek yogurt topped with 2 clementines.", dietsDinner:"3 ounces roasted pork tenderloin with 1 cup baked acorn squash, mashed with a pinch of cinnamon; 2 to 3 cups salad greens "),
    Diet_entry(day: "Saturday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Two eggs scrambled, one cup of oatmeal cooked with 2 teaspoons peanut butter, and one bananna sliced", dietsLunch: "Salad: Spinach, tomatoes, cucumbers, shredded carrots, mushrooms, Quinoa, 4 oz grilled chicken, 2 tablespoons salad dressing, 1 cup straberries", dietsDinner: "4 ounces baked chicken breast, 1 cup mashed potatos with 1 tablespoon butter, 2 cups steamed broccoli, 1 cup blueberries"),
    Diet_entry(day: "Sunday", calorieCount: "1200", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "2 egg whites, 1 ounce turkey sausage, 2 slices light whole grain bread, 1 cup mellon, 1 tablespoon light butter spread", dietsLunch:"4 ounces Salmon, 1/2 cup brown rice, 1/2 cup sweet potato, 2 cups of salad, 1 apple, 2 tablespoons humus", dietsDinner:"4 ounces of steak, 1 cup mashed potatoes, 1 cup cooked broccoli, 1 small bannana"),
]

let dietUnderWeightData = [
    Diet_entry(day: "Monday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Peanut Butter on Wholegrain Toast: Toasted wholegrain bread+ 2 tbsp peanut butter. Drizzle with honey to taste. Serve with 1 hot chocolate, made with milk + 1 serve of fruit", dietsLunch: "Chicken and Pasta Salad: Cooked chicken + pasta + 1 cup leafy green vegetables (eg. spinach, rocket) + tomato + avocado + crumbled feta cheese + olive oil/vinegar dressing.", dietsDinner: "Lamb Chops and Vegetables: Lamb chop, trimmed & shallow fried in olive oil. Serve with sweet potato mash made with milk and olive oil + 2 cups cooked vegetables. Fresh Fruit and Cheese Platter"),
    Diet_entry(day: "Tuesday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Chia Porridge with Fruit: 2 tbsp chia seeds + rolled oats + 1.5 cup full cream milk + 1 serve of fruit", dietsLunch: "Egg, Cheese and Salad Wrap: 2 boiled & mashed eggs + 2 cheese slices + avocado + 1 cup salad vegetables (eg. lettuce, cucumber, carrot, capsicum) rolled up in tortilla bread (make 2 wraps) + 1 cup fruit juice.", dietsDinner: "Baked Salmon, Cous Cous and Vegetables: Oven baked salmon fillet, sprinkled with sesame oil and sesame seeds + wholemeal cous cous + 2 cups cooked vegetables. Serve with hommus. Fruit Salad Dessert: Fresh fruit salad with ice cream."),
    Diet_entry(day: "Wednesday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Sweet Potato Spanish Omelette (1 serve): Serve with 1 cafe latte or hot chocolate made with full cream milk.", dietsLunch: "Lentil, Vegetables and Barley Soup: Lentils with 1 cup chopped vegetables (eg. carrot, pumpkin, celery, onion), vegetable stock and barley. Serve with dollop of natural yoghurt. + 1 serve of fruit.", dietsDinner: "Spaghetti Bolognese: Lean mince with tomato, tomato puree, herbs & garlic served on spaghetti and sprinkled with cheese + 1 cup salad (eg. baby spinach, carrots, cucumber) with olive oil based dressing. Fruit Smoothie: Made with 1 cup milk + 1 tbsp walnuts + fruit (eg. a small mango or berries)."),
    Diet_entry(day: "Thursday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Wholegrain Cereal with Milk and Fruit: Wholegrain flaky cereal + full cream milk + 2 tbsp linseeds + 1 serve of fruit (eg. 6 dried apricot halves or 4 small plums).", dietsLunch: "Chicken and Noodle Stir-fry: Sliced lean chicken + Hokkein noodles + 1 cup vegetables (eg. beans, capsicum, spinach, carrot) cooked in sesame oil + sweet soy sauce dressing. Sprinkle with sesame seeds.", dietsDinner: "Nasi Goreng Tray Bake (1 serve): Serve with 2 cup mixed salad vegetables. Fruit Pop: Made with frozen fruits (eg. bananas or mangos) with Greek yogurt."),
    Diet_entry(day: "Friday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Poached Eggs with Sauteed Field Mushroom and Avocado (1 serve): Serve with 1 cafe latte or hot chocolate made with full cream milk.", dietsLunch: "Fish and Chips: Dip fish fillets in flour, egg then breadcrumbs and shallow fry in canola oil. Serve with homemade thick potato chunky chips, lemon wedges and 2 cups mixed salad vegetables with olive oil dressing. + 1 serve of fruit.", dietsDinner: "Mango Chicken and Corn: Grilled chicken thighs served with mango salsa, corn on the cob & 1.5 cups baked vegetables (eg. carrot, onion, beans) in olive oil. Yogurt Parfait: Layer 1 tub of yogurt and rolled oats in tall serving glasses. Top with handful of mixed nuts and/or seeds."),
    Diet_entry(day: "Saturday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Fruit Toast with Berry Smoothie: Slices of fruit toast spread with butter and/or jam to taste. Serve with a smoothie made with 1 cup full cream milk + 1 cup berries + 2 tbsp linseed/sunflower/almond meal.", dietsLunch: "Tuna and Quinoa Salad: Tuna in oil mixed with 3 bean mix + 2 cups salad vegetables (eg. leafy greens, tomato, cucumber, carrot, capsicum) + cooked quinoa + olive oil/vinegar dressing.", dietsDinner: "Easy Fish Pie: Serve with 2 cup mixed salad vegetables. Pavlova and Fruit: Pavlova topped with fresh fruit salad. Serve with custard."),
    Diet_entry(day: "Sunday", calorieCount: "2500", image: "istockphoto-505020568-612x612", breakfast: "Breakfast", lunch: "Lunch", dinner: "Dinner", dietsBreakfast: "Bechamel Spinach Baked Egg (1 serve): Serve with 1 café latte.", dietsLunch: "Beef and Noodle Soup: Thinly sliced beef + fresh flat rice noodles + 1 cup vegetables (eg. bean sprouts, carrot, broccoli) cooked in vegetable stock. Sprinkle with diced green onion. + 1 serve of fruit (eg. 1 medium apple or banana).", dietsDinner: "Pork Roast and Vegetables: Lean pork roast + baked potato + 1.5 cups baked vegetables + olive oil (for cooking). Fruit Crepe: Sliced fruit and ricotta cheese wrapped in crepe. Drizzle with syrup or honey to taste."),
]


