void main(){
  Deck deck = new Deck();
//   deck.shuffle();
  
//   print(deck.cardsWithSuite('Two'));
//   print(deck);
//   print(deck.deal(5));
//   print(deck);
  
  deck.removeCard('Ace', 'Diamonds');

}


class Deck{
  List<Card> cards = [];
  
  Deck(){
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    
    for(var suit in suits){
      for(var rank in ranks){
        var card = new Card(
          suit: suit,
          rank: rank
        );
        cards.add(card);
      }
    }
  }
  
  toString(){
    return cards.toString();
  }
  
  shuffle(){
    return cards.shuffle();
  }
  
   cardsWithSuite(String suit){
//      return cards.where((card){
//        return card.suit == suit;
//      });
      return cards.where((card) => card.suit == suit);
   }
  
  deal(int handSize){
    var hand = cards.sublist(0, handSize);
    cards.sublist(handSize);
    
    return hand;
  }
  
  removeCard(String suit, String rank){
    return cards.removeWhere((card){
      return card.suit == suit && card.rank == rank;
    });
  }
}



class Card{
  String suit;
  String rank;
  
  Card({this.suit, this.rank});
  
  toString(){
    return '$suit of $rank';
  }
}