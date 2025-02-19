# 🚀 Sticky Header in SwiftUI using GeometryReader  

This repository demonstrates how to create a **sticky header** in SwiftUI using `GeometryReader` and `proxy.frame(in: .scrollView).minY`. The effect ensures that the header remains fixed at the top when scrolling up in a `ScrollView`.  

## 📸 Demo Preview  
<img src="https://github.com/user-attachments/assets/e138c722-0ac9-4d4f-a7d4-f545404ec410" width=30%>

## 📌 How It Works  
- **Tracking the header position** – `GeometryReader` allows us to monitor the header’s coordinates in the `ScrollView` space.  
- **Detecting when the header reaches the top** – If `minY <= 0`, we "stick" the header at the top.  
- **Smooth and efficient** – Achieves the sticky effect without unnecessary complexity.  

## 🔹 Why Use This Approach?  
✅ Lightweight and efficient solution using built-in SwiftUI tools.  
✅ No need for custom scroll detection logic.  
✅ Works seamlessly with other SwiftUI components.  
