<div align="center">

# 📞 Thai Hotline App

### แอปพลิเคชันรวมเบอร์สายด่วนสำคัญของประเทศไทย

_One-tap access to every important Thai hotline — emergency, transport, banking, and utility services._

<p>
  <img src="https://img.shields.io/badge/Flutter-3.2%2B-02569B?logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-3.2%2B-0175C2?logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Windows-4F7A1F" alt="Platform" />
  <img src="https://img.shields.io/badge/Theme-Green%20%2F%20White-8BC34A" alt="Theme" />
  <img src="https://img.shields.io/badge/License-Educational-lightgrey" alt="License" />
</p>

</div>

---

## 🎬 Preview

<div align="center">

https://github.com/user-attachments/assets/c49930e6-04c6-490c-8f02-0b962f4cef48

</div>

---

## ✨ Features

| | Feature | Description |
| :---: | :--- | :--- |
| 🚨 | **เหตุฉุกเฉิน** | ตำรวจ 191, ดับเพลิง 199, ตำรวจน้ำ 1196, กู้ชีพ 1669 และสายด่วนฉุกเฉินอื่น ๆ |
| 🚗 | **การเดินทาง** | ตำรวจทางหลวง, ตำรวจท่องเที่ยว, ขสมก., บขส., การรถไฟ, EXAT ฯลฯ |
| 🏦 | **ธนาคาร** | 16 ธนาคารหลักของไทย พร้อมโลโก้และเบอร์ Call Center จริง |
| 💡 | **สาธารณูปโภค** | การประปา, การไฟฟ้า, กรมชลประทาน, ประกันสังคม |
| 📞 | **One-tap Call** | แตะครั้งเดียวโทรออกผ่าน `url_launcher` |
| 🔍 | **ค้นหาเบอร์** | ค้นหาแบบ real-time ด้วย SearchDelegate |
| 🎨 | **UI สะอาดตา** | ธีมขาว-เขียว สไตล์ AIS, Material 3, Rounded Card |
| 🖼️ | **Promo Banner** | PageView แบบ auto-scroll พร้อม indicator |
| 👤 | **หน้าโปรไฟล์** | แสดงข้อมูลนักศึกษา/ผู้พัฒนา พร้อมปุ่ม copy และ send email |
| 🌐 | **Multi-platform** | รองรับ Android, iOS และ Windows |

---

## 📱 Screenshots

<div align="center">

| Splash | Home | หมวดหมู่ |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/d5fc8c03-621c-4de0-bb7b-6cb81e5116a5" width="240" /> | <img src="https://github.com/user-attachments/assets/2970392d-b7dd-450c-bf8a-3d4529499006" width="240" /> | <img src="https://github.com/user-attachments/assets/65743768-61cf-46ee-9444-523e6c9ca313" width="240" /> |
| **เหตุฉุกเฉิน** | **การเดินทาง** | **โปรไฟล์** |
| <img src="https://github.com/user-attachments/assets/49109041-0c4b-413d-9c21-63d090d4f01d" width="240" /> | <img src="https://github.com/user-attachments/assets/29666a20-2829-4e83-b7cc-7eaaa50716fa" width="240" /> | <img src="https://github.com/user-attachments/assets/22170f9c-e740-4f6c-a23d-05d627e85249" width="240" /> |

</div>

---

## 🧩 Tech Stack

| Layer | Technology |
| :--- | :--- |
| **Framework** | Flutter 3.2+ / Dart 3.2+ |
| **UI** | Material 3, `google_fonts`, `font_awesome_flutter` |
| **Navigation** | Native `Navigator` (`MaterialPageRoute`) |
| **Calling** | [`url_launcher`](https://pub.dev/packages/url_launcher) |
| **Carousel** | [`carousel_slider`](https://pub.dev/packages/carousel_slider) + custom `PageView` |
| **Maps** | [`flutter_map`](https://pub.dev/packages/flutter_map) + [`latlong2`](https://pub.dev/packages/latlong2) |
| **Icons** | [`icons_launcher`](https://pub.dev/packages/icons_launcher), [`flutter_svg`](https://pub.dev/packages/flutter_svg) |

---

## 📂 Project Structure

```text
flutter_thai_hotline_app/
├── assets/
│   ├── images/              # banner & profile images
│   └── icon/
│       ├── emergency/       # ไอคอนหมวดเหตุฉุกเฉิน
│       ├── transport/       # ไอคอนหมวดการเดินทาง
│       ├── utility/         # ไอคอนหมวดสาธารณูปโภค
│       └── *.png            # โลโก้ธนาคาร 16 ธนาคาร
├── lib/
│   ├── main.dart
│   ├── data/
│   │   └── hotlines.dart    # รายการสายด่วนทั้งหมด (data layer)
│   ├── views/
│   │   ├── splash_screen_ui.dart
│   │   ├── home_ui.dart
│   │   ├── about_ui.dart
│   │   ├── sub_a_home_ui.dart   # เหตุฉุกเฉิน
│   │   ├── sub_b_home_ui.dart   # การเดินทาง
│   │   ├── sub_c_home_ui.dart   # ธนาคาร
│   │   └── sub_d_home_ui.dart   # สาธารณูปโภค
│   └── widgets/
│       ├── hotline_tile.dart
│       ├── hotline_search_delegate.dart
│       ├── promo_banner.dart
│       └── category_banner.dart
└── pubspec.yaml
```

---

## 💡 Inspiration & Acknowledgement

โปรเจกต์นี้จัดทำขึ้นเพื่อการศึกษาเท่านั้น โดยได้รับ **แรงบันดาลใจด้านการออกแบบ (Design Inspiration)** จากแอปพลิเคชันชั้นนำของประเทศไทย เช่น **Grab, AIS และ LINE MAN** ในแง่ของการจัดวาง UI, โทนสี และประสบการณ์การใช้งานที่สะอาดตาและเข้าถึงง่าย

> โปรเจกต์นี้ **ไม่มีวัตถุประสงค์เชิงพาณิชย์** ไม่ได้จัดทำขึ้นเพื่อจำหน่าย แจกจ่าย หรือแสวงหาผลกำไรในรูปแบบใด ๆ และไม่มีส่วนเกี่ยวข้องกับบริษัทหรือหน่วยงานที่เป็นเจ้าของแอปพลิเคชันข้างต้น

เครื่องหมายการค้า โลโก้ เบอร์สายด่วน และชื่อหน่วยงานที่ปรากฏในแอปพลิเคชันนี้ เป็นกรรมสิทธิ์ของเจ้าของที่ถูกต้องตามกฎหมาย ผู้พัฒนานำมาใช้อ้างอิงเพื่อ **วัตถุประสงค์ทางการศึกษา** ในรายวิชา Flutter Application Development เท่านั้น

---

## 👨‍💻 Developer

<div align="center">

**ชนาธิป จุ้ยเจิม** &nbsp;·&nbsp; _Chanathip Chueycherm_

รหัสนักศึกษา **6852D10005**
คณะศิลปศาสตร์และวิทยาศาสตร์
มหาวิทยาลัยเอเชียอาคเนย์ (Southeast Asia University)

📧 [s6852d10005@sau.ac.th](mailto:s6852d10005@sau.ac.th)

</div>

---

<div align="center">

_Made with ❤️ using Flutter · © 2025 Chanathip Chueycherm_

</div>

