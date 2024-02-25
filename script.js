const mongoose = require('mongoose');
const User = require("./user");

mongoose.connect("mongodb://localhost/testdb");

run()

async function run(){
    try {
    const user = await User.deleteOne({ 
        // name: '', 
        // age: ,
        // //email: String,
        // //createdAt: Date,
        // // updatedAt: Date,
        // // bestFriend: mongoose.SchemaTypes.ObjectId,
        // hobbies: ['cantar', 'ballar'],
        // address: {
        //     street: 'aquí 5',
        //     city: 'allà'
        // }
 });
console.log(user)
    } catch (e) {
        console.log(e.message)
    }
    //const user = new User({ name: 'Glòria', age: 44 });
   
}