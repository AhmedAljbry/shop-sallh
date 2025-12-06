![Shop Sallh](Gemini_Generated_Image_owl2ccowl2ccowl2 (1).png)

# Shop Sallh – Modern E-Commerce App  
### Built with Flutter + REST API  
### Developed by **Ahmed Aljbry**

**Shop Sallh** is a clean and modern Flutter e-commerce application that allows users to browse products, explore categories, add items to cart, and place orders using a real API backend.  
The app features smooth UI, full shopping flow, authentication, and scalable architecture suitable for production use.

---

## 🛍️ Features

### 🔐 Authentication
- User login  
- User registration  
- API-based authentication  
- Secure token handling  

### 🧭 Categories & Products
- Browse product categories  
- View products per category  
- Responsive grid layout  
- Product details page:
  - Image  
  - Price  
  - Description  

### 🛒 Cart System
- Add products to cart  
- Remove items  
- Update quantities  
- Persistent cart state  

### 📝 Order Placement
- Full checkout process  
- Submit order request through API  
- Cash-on-delivery flow  
- Order confirmation screen  

### 🔍 Search (if included)
- Search by name or category  
- Instant filtered results  

### 🎨 Clean UI / UX
- Modern visual design  
- Smooth transitions  
- Works on all screen sizes  

---

## 🚀 Tech Stack

| Technology | Purpose |
|-----------|----------|
| **Flutter** | Mobile UI / app development |
| **Dart** | Programming language |
| **REST API** | Backend communication |
| **HTTP / Dio** | API client |
| **Provider / Riverpod / Bloc** | State management |
| **Shared Preferences** | Local storage (token, cart) |

---

## 🧱 Project Structure (Recommended)

```txt
lib/
  core/
    config/          # API endpoints
    constants/       # Colors, styles
    utils/           # Helpers, validators

  data/
    models/          # Product, user, order models
    services/        # API services
    repository/      # Data access layer

  features/
    auth/
    home/
    categories/
    products/
    cart/
    checkout/
    profile/

  app.dart
  main.dart
 
