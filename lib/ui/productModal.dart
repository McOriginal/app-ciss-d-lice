import 'package:uuid/uuid.dart';

// Modèle pour les catégories
class Category {
  final String id;
  final String name;
  final String imageUrl;

  Category({required this.id, required this.name, required this.imageUrl});
}

// Modèle pour les produits
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  bool isFavorite;
  final String categoryId;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.categoryId,
    required this.description,
  });
}

// Générateur UUID
const uuid = Uuid();

// Création des catégories
final categories = [
  Category(
    id: uuid.v4(),
    name: "Fruits",
    imageUrl: "assets/images/fruit.png",
  ),
  Category(
    id: uuid.v4(),
    name: "Légumes",
    imageUrl: "assets/images/leguime.png",
  ),
  Category(
    id: uuid.v4(),
    name: "Jus",
    imageUrl: "assets/images/juis.png",
  ),
  Category(
    id: uuid.v4(),
    name: "Amuse-gueule",
    imageUrl: "assets/images/snacks.png",
  ),
];

// Création des produits
final products = [
  Product(
    id: uuid.v4(),
    name: "Pomme",
    price: 1.5,
    imageUrl: "assets/images/pomme2.png",
    isFavorite: false,
    categoryId: categories[0].name,
    description:
        "Une pomme juteuse et croquante.\nParfaite pour les collations.\nRiche en vitamines.\nIdéale pour les tartes.",
  ),
  Product(
    id: uuid.v4(),
    name: "Banane",
    price: 1.0,
    imageUrl: "assets/images/bannane1.png",
    isFavorite: false,
    categoryId: categories[0].name,
    description:
        "Une banane douce et sucrée.\nIdéale pour les smoothies.\nRiche en potassium.\nBonne pour la digestion.",
  ),
  Product(
    id: uuid.v4(),
    name: "Carotte",
    price: 0.8,
    imageUrl: "assets/images/carote.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une carotte riche en vitamine A.\nIdéale pour les smoothies.\nRiche en potassium.\nBonne pour la vue.",
  ),
  Product(
    id: uuid.v4(),
    name: "Tomate",
    price: 1.2,
    imageUrl: "assets/images/tomate1.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une tomate riche en lycopène.\nIdéale pour les salades.\nRiche en vitamine C.\nBonne pour la peau.",
  ),
  Product(
    id: uuid.v4(),
    name: "Jus d'orange",
    price: 2.5,
    imageUrl: "assets/images/jus_orange.png",
    isFavorite: false,
    categoryId: categories[2].name,
    description:
        "Un jus d'orange frais et naturel.\nRiche en vitamine C.\nIdéal pour les cocktails.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Jus de mangue",
    price: 3.0,
    imageUrl: "assets/images/jus_mangue.png",
    isFavorite: false,
    categoryId: categories[2].name,
    description:
        "Un jus de mangue doux et fruité.\nRiche en vitamine C.\nIdéal pour les smoothies.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Pomme",
    price: 1.5,
    imageUrl: "assets/images/pomme.png",
    isFavorite: false,
    categoryId: categories[3].name,
    description:
        "Une pomme juteuse et croquante.\nParfaite pour les collations.\nRiche en vitamines.\nIdéale pour les tartes.",
  ),
  Product(
    id: uuid.v4(),
    name: "Annanas",
    price: 2.0,
    imageUrl: "assets/images/anana1.png",
    isFavorite: false,
    categoryId: categories[3].name,
    description:
        "Un annanas doux et sucré.\nIdéal pour les smoothies.\nRiche en potassium.\nBon pour la digestion.",
  ),
  Product(
    id: uuid.v4(),
    name: "Raisin",
    price: 2.5,
    imageUrl: "assets/images/rezin1.png",
    isFavorite: false,
    categoryId: categories[0].name,
    description:
        "Un raisin sec et sucré.\nIdéal pour les desserts.\nRiche en potassium.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Pastèque",
    price: 1.8,
    imageUrl: "assets/images/pasteque1.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une pastèque douce et sucrée.\nIdéale pour les smoothies.\nRiche en eau.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Gingembre",
    price: 1.2,
    imageUrl: "assets/images/gimgembre.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une racine de gingembre riche en antioxydants.\nIdéal pour les smoothies.\nRiche en eau.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Jus de fraise",
    price: 3.2,
    imageUrl: "assets/images/jus_fraise.png",
    isFavorite: false,
    categoryId: categories[2].name,
    description:
        "Un jus de fraise doux et fruité.\nRiche en vitamine C.\nIdéal pour les smoothies.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Raisin",
    price: 2.3,
    imageUrl: "assets/images/rezin2.png",
    isFavorite: false,
    categoryId: categories[3].name,
    description:
        "Un raisin sec et sucré.\nIdéal pour les desserts.\nRiche en potassium.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Mangue",
    price: 1.7,
    imageUrl: "assets/images/mangue.png",
    isFavorite: false,
    categoryId: categories[0].name,
    description:
        "Une mangue douce et sucrée.\nIdéale pour les smoothies.\nRiche en vitamine C.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Orange",
    price: 0.5,
    imageUrl: "assets/images/lemon1.png",
    isFavorite: false,
    categoryId: categories[0].name,
    description:
        "Une orange sucrée et aromatique.\nIdéale pour les smoothies.\nRiche en vitamine C.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Papaye",
    price: 1.3,
    imageUrl: "assets/images/papaye.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une papaye douce et sucrée.\nIdéale pour les smoothies.\nRiche en eau.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Jus de carotte",
    price: 2.8,
    imageUrl: "assets/images/jus_carotte.png",
    isFavorite: false,
    categoryId: categories[2].name,
    description:
        "Un jus de carotte doux et fruité.\nRiche en eau.\nIdéal pour les smoothies.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Noix de coco",
    price: 2.0,
    imageUrl: "assets/images/coco.png",
    isFavorite: false,
    categoryId: categories[3].name,
    description:
        "Une noix de coco douce et sucrée.\nIdéale pour les smoothies.\nRiche en eau.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Concombre",
    price: 1.8,
    imageUrl: "assets/images/comcombre.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Un concombre doux et sucré.\nIdéal pour les smoothies.\nRiche en eau.\nBon pour la santé.",
  ),
  Product(
    id: uuid.v4(),
    name: "Mangue",
    price: 1.0,
    imageUrl: "assets/images/mangue2.png",
    isFavorite: false,
    categoryId: categories[1].name,
    description:
        "Une mangue douce et sucrée.\nIdéale pour les smoothies.\nRiche en vitamine C.\nBon pour la santé.",
  ),
];
