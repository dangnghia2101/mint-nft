import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import UserModel "./UserModel";

// Define the actor
actor UserInfo {

  type User = UserModel.User;


  func natHash(n : Nat) : Hash.Hash { 
    Text.hash(Nat.toText(n))
  };

  var todos = Map.HashMap<Nat, User>(0, Nat.equal, natHash);
  var nextId : Nat = 0;

  public func addTodo(fistName : Text, lastName : Text, sex: Text, datOf: Text, phone: Text, addres: Text) : async Nat {
    let id = nextId;
    todos.put(id, { fistName = fistName; lastName = lastName; sex = sex; datOf = datOf; phone = phone; addres = addres});
    nextId += 1;
    id
  };

 

  public query func showTodos() : async Text {
    var output : Text = "\n___TO-DOs___";
    for (user : User in todos.vals()) {
      output #= "\n" # user.fistName;
      output #= user.lastName;
      output #= user.sex;
      output #= user.datOf;
      output #= user.phone;
      output #= user.addres;
    };
    output # "\n"
  };
}