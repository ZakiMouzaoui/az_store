import '../../features/shop/models/product_model.dart';

final products = [
  /*
    Product(
      id: "11",
      name: "Apple AirPods Pro",
      stock: 200,
      price: 249.00,
      description: "The Apple AirPods Pro are the ultimate earphones for music lovers. They feature a custom-built high-excursion, low-distortion driver, a high dynamic range amplifier, a adaptive EQ, a active noise cancellation, and a transparency mode. They also have a wireless charging case, a force sensor, a H1 chip, and a Siri voice assistant. The Apple AirPods Pro offer a superb sound quality, a comfortable fit, and a seamless connection.",
      brandId: "1",
      brandName: "Apple",
      categoryId: "11",
      isFeatured: true,
      images: ["apple_airpods_pro_1.png", "apple_airpods_pro_2.png", "apple_airpods_pro_3.png"],
      productAttributeModels: [],
      //type: ProductType.single,
      skus: [],
    ),
    Product(
      id: "12",
      name: "Apple Watch Series 7",
      stock: 150,
      price: 399.00,
      description: "The Apple Watch Series 7 is the ultimate smartwatch for health and fitness lovers. It features a stunning 1.7-inch Retina display, a S7 SiP with 64-bit dual-core processor, a built-in GPS, a heart rate sensor, a blood oxygen sensor, and a ECG app. It also has a swimproof design, a digital crown, a fall detection, a emergency SOS, and a Siri voice assistant. The Apple Watch Series 7 offers a comprehensive health and wellness tracking, a customizable design, and a seamless integration.",
      brandId: "1",
      brandName: "Apple",
      categoryId: "5",
      isFeatured: true,
      images: ["apple_watch_series_7_1.png", "apple_watch_series_7_2.png", "apple_watch_series_7_3.png"],
      productAttributeModels: [
        ProductAttributeModel(
          name: "Color",
          values: ["Silver", "Gold", "Space Gray", "Blue", "Red"],
        ),
        ProductAttributeModel(
          name: "Band",
          values: ["Sport Band", "Sport Loop", "Braided Solo Loop", "Leather Link", "Milanese Loop"],
        ),
      ],
      //type: ProductType.variation,
      skus: [
        SKU(
          id: "12-1",
          description: "Apple Watch Series 7 Silver with Sport Band",
          stock: 30,
          price: 399.00,
          image: "apple_watch_series_7_silver_with_sport_band.png",
          variations: {
            "Color": "Silver",
            "Band": "Sport Band",
          },
        ),
        SKU(
          id: "12-2",
          description: "Apple Watch Series 7 Gold with Braided Solo Loop",
          stock: 25,
          price: 449.00,
          image: "apple_watch_series_7_gold_with_braided_solo_loop.png",
          variations: {
            "Color": "Gold",
            "Band": "Braided Solo Loop",
          },
        ),
        SKU(
          id: "12-3",
          description: "Apple Watch Series 7 Space Gray with Leather Link",
          stock: 20,
          price: 449.00,
          image: "apple_watch_series_7_space_gray_with_leather_link.png",
          variations: {
            "Color": "Space Gray",
            "Band": "Leather Link",
          },
        ),
      ],
    ),
    Product(
      id: "13",
      name: "Apple iPad Pro 12.9-inch",
      stock: 100,
      price: 1099.00,
      description: "The Apple iPad Pro 12.9-inch is the ultimate tablet for creativity and productivity lovers. It features a stunning 12.9-inch Liquid Retina XDR display, a powerful M1 chip, a 12MP wide and 10MP ultra-wide camera, a LiDAR scanner, and a Face ID. It also has a USB-C port, a Thunderbolt port, a Smart Connector, and a Apple Pencil compatibility. The Apple iPad Pro 12.9-inch comes with iPadOS 15, which offers new features like widgets, app library, multitasking, and more.",
      brandId: "1",
      brandName: "Apple",
      categoryId: "1",
      isFeatured: true,
      images: ["apple_ipad_pro_12_9_inch_1.png", "apple_ipad_pro_12_9_inch_2.png", "apple_ipad_pro_12_9_inch_3.png"],
      productAttributeModels: [
        ProductAttributeModel(
          name: "Color",
          values: ["Silver", "Space Gray"],
        ),
        ProductAttributeModel(
          name: "Storage",
          values: ["128GB", "256GB", "512GB", "1TB", "2TB"],
        ),
      ],
      //type: ProductType.variation,
      skus: [
        SKU(
          id: "13-1",
          description: "Apple iPad Pro 12.9-inch Silver 128GB",
          stock: 25,
          price: 1099.00,
          image: "apple_ipad_pro_12_9_inch_silver_128gb.png",
          variations: {
            "Color": "Silver",
            "Storage": "128GB",
          },
        ),
        SKU(
          id: "13-2",
          description: "Apple iPad Pro 12.9-inch Space Gray 256GB",
          stock: 20,
          price: 1199.00,
          image: "apple_ipad_pro_12_9_inch_space_gray_256gb.png",
          variations: {
            "Color": "Space Gray",
            "Storage": "256GB",
          },
        ),
        SKU(
          id: "13-3",
          description: "Apple iPad Pro 12.9-inch Silver 512GB",
          stock: 15,
          price: 1399.00,
          image: "apple_ipad_pro_12_9_inch_silver_512gb.png",
          variations: {
            "Color": "Silver",
            "Storage": "512GB",
          },
        ),
      ],
    ),
     */
  /*
    Product(
      id: "14",
      name: "Samsung Galaxy Tab S7+ 12.4-inch Tablet",
      stock: 80,
      price: 849.99,
      description: "The Samsung Galaxy Tab S7+ 12.4-inch Tablet is the ultimate tablet for entertainment and productivity lovers. It features a stunning 12.4-inch Super AMOLED display, a powerful Snapdragon 865+ processor, a 8GB RAM, a 256GB storage, and a S Pen stylus. It also has a quad speaker system, a dual camera system, a fingerprint scanner, and a Samsung DeX mode. The Samsung Galaxy Tab S7+ 12.4-inch Tablet comes with Android 11, which offers new features like split-screen, dark mode, and more.",
      brandId: "2",
      brandName: "Samsung",
      categoryId: "1",
      isFeatured: true,
      images: ["samsung_galaxy_tab_s7+_1.png", "samsung_galaxy_tab_s7+_2.png", "samsung_galaxy_tab_s7+_3.png"],
      productAttributeModels: [
        ProductAttributeModel(
          name: "Color",
          values: ["#000000", "#C0C0C0", "#CD7F32"],
        ),
      ],
      skus: [
        SKU(
          id: "14-1",
          description: "Samsung Galaxy Tab S7+ 12.4-inch Tablet Mystic Black",
          stock: 30,
          price: 849.99,
          image: "samsung_galaxy_tab_s7+_mystic_black.png",
          variations: {
            "Color": "#000000",
          },
        ),
        SKU(
          id: "14-2",
          description: "Samsung Galaxy Tab S7+ 12.4-inch Tablet Mystic Silver",
          stock: 25,
          price: 849.99,
          image: "samsung_galaxy_tab_s7+_mystic_silver.png",
          variations: {
            "Color": "#C0C0C0",
          },
        ),
        SKU(
          id: "14-3",
          description: "Samsung Galaxy Tab S7+ 12.4-inch Tablet Mystic Bronze",
          stock: 20,
          price: 849.99,
          image: "samsung_galaxy_tab_s7+_mystic_bronze.png",
          variations: {
            "Color": "#CD7F32",
          },
        ),
      ],
    ),
     */
  /*
    Product(
      id: "17",
      name: "HP Envy x360 15.6-inch Touchscreen 2-in-1 Laptop",
      stock: 60,
      price: 799.99,
      description: "The HP Envy x360 15.6-inch Touchscreen 2-in-1 Laptop is the ultimate laptop for versatility lovers. It features a stunning 15.6-inch FHD IPS touchscreen display, a powerful Intel Core i5-1135G7 processor, a 8GB RAM, a 256GB SSD, and a Intel Iris Xe graphics card. It also has a 360-degree hinge, a backlit keyboard, a fingerprint reader, a HD webcam, and a Windows 10 Home operating system. The HP Envy x360 15.6-inch Touchscreen 2-in-1 Laptop is ideal for working, learning, and playing in any mode.",
      brandId: "6",
      brandName: "HP",
      categoryId: "10",
      isFeatured: false,
      images: ["hp_envy_x360_15_6_inch_touchscreen_2_in_1_laptop_1.png", "hp_envy_x360_15_6_inch_touchscreen_2_in_1_laptop_2.png", "hp_envy_x360_15_6_inch_touchscreen_2_in_1_laptop_3.png"],
      productAttributeModels: [],
      skus: [],
    ),
    Product(
      id: "18",
      name: "HP Pavilion 14-inch Laptop",
      stock: 80,
      price: 599.99,
      description: "The HP Pavilion 14-inch Laptop is the ultimate laptop for performance lovers. It features a stunning 14-inch FHD IPS display, a powerful AMD Ryzen 5 5500U processor, a 8GB RAM, a 256GB SSD, and a AMD Radeon graphics card. It also has a backlit keyboard, a dual speaker system, a HD webcam, and a Windows 10 Home operating system. The HP Pavilion 14-inch Laptop is ideal for multitasking, streaming, and browsing.",
      brandId: "6",
      brandName: "HP",
      categoryId: "10",
      isFeatured: false,
      images: ["hp_pavilion_14_inch_laptop_1.png", "hp_pavilion_14_inch_laptop_2.png", "hp_pavilion_14_inch_laptop_3.png"],
      productAttributeModels: [],
      skus: [],
    ),
    Product(
      id: "19",
      name: "HP Omen 15.6-inch Gaming Laptop",
      stock: 50,
      price: 999.99,
      description: "The HP Omen 15.6-inch Gaming Laptop is the ultimate laptop for gaming lovers. It features a stunning 15.6-inch FHD IPS display, a powerful Intel Core i7-10750H processor, a 16GB RAM, a 512GB SSD, and a NVIDIA GeForce RTX 2060 graphics card. It also has a RGB backlit keyboard, a dual fan system, a Bang & Olufsen audio system, and a Windows 10 Home operating system. The HP Omen 15.6-inch Gaming Laptop is ideal for playing, streaming, and multitasking.",
      brandId: "6",
      brandName: "HP",
      categoryId: "10",
      isFeatured: false,
      images: ["hp_omen_15_6_inch_gaming_laptop_1.png", "hp_omen_15_6_inch_gaming_laptop_2.png", "hp_omen_15_6_inch_gaming_laptop_3.png"],
      productAttributeModels: [],
      skus: [],
    ),
     */
  /*
  Product(
    id: "22",
    name: "Samsung Galaxy S21 FE",
    stock: 100,
    price: 699.99,
    description: "The Samsung Galaxy S21 FE is the ultimate smartphone for fun and entertainment lovers. It features a stunning 6.4-inch Dynamic AMOLED display, a powerful Snapdragon 888 processor, a pro-grade camera system with 12MP wide, 8MP telephoto, 12MP ultra-wide lenses, a 32MP selfie camera, and a 4K video recording. It also has a 5G connectivity, a wireless charging, and a IP68 water and dust resistance rating. The Samsung Galaxy S21 FE comes with Android 11, which offers new features like Nearby Share, Bubbles, Screen Recorder, and more.",
    brandId: "2",
    brandName: "Samsung",
    categoryId: "9",
    parentCategoryId: "1",
    isFeatured: false,
    images: ["samsung_galaxy_s21_fe_1.png", "samsung_galaxy_s21_fe_2.png", "samsung_galaxy_s21_fe_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#FF00FF"],
      ),
      ProductAttributeModel(
        name: "Storage",
        values: ["128GB", "256GB"],
      ),
    ],
    skus: [
      SKU(
        id: "22-1",
        description: "Samsung Galaxy S21 FE Red 128GB",
        stock: 25,
        price: 699.99,
        image: "samsung_galaxy_s21_fe_red_128gb.png",
        variations: {
          "Color": "#FF0000",
          "Storage": "128GB",
        },
      ),
      SKU(
        id: "22-2",
        description: "Samsung Galaxy S21 FE Green 256GB",
        stock: 20,
        price: 749.99,
        image: "samsung_galaxy_s21_fe_green_256gb.png",
        variations: {
          "Color": "#00FF00",
          "Storage": "256GB",
        },
      ),
      SKU(
        id: "22-3",
        description: "Samsung Galaxy S21 FE Blue 128GB",
        stock: 15,
        price: 699.99,
        image: "samsung_galaxy_s21_fe_blue_128gb.png",
        variations: {
          "Color": "#0000FF",
          "Storage": "128GB",
        },
      ),
    ],
  ),
  Product(
    id: "23",
    name: "Samsung Galaxy A52 5G",
    stock: 120,
    price: 499.99,
    description: "The Samsung Galaxy A52 5G is the ultimate smartphone for budget and quality lovers. It features a stunning 6.5-inch Super AMOLED display, a powerful Snapdragon 750G processor, a quad camera system with 64MP wide, 12MP ultra-wide, 5MP macro, 5MP depth lenses, a 32MP selfie camera, and a 4K video recording. It also has a 5G connectivity, a wireless charging, and a IP67 water and dust resistance rating. The Samsung Galaxy A52 5G comes with Android 11, which offers new features like Nearby Share, Bubbles, Screen Recorder, and more.",
    brandId: "2",
    brandName: "Samsung",
    categoryId: "9",
    parentCategoryId: "1",
    isFeatured: false,
    images: ["samsung_galaxy_a52_5g_1.png", "samsung_galaxy_a52_5g_2.png", "samsung_galaxy_a52_5g_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#000000", "#C0C0C0", "#FFC0CB", "#0000FF"],
      ),
      ProductAttributeModel(
        name: "Storage",
        values: ["128GB", "256GB"],
      ),
    ],
    skus: [
      SKU(
        id: "23-1",
        description: "Samsung Galaxy A52 5G Black 128GB",
        stock: 40,
        price: 499.99,
        image: "samsung_galaxy_a52_5g_black_128gb.png",
        variations: {
          "Color": "#000000",
          "Storage": "128GB",
        },
      ),
      SKU(
        id: "23-2",
        description: "Samsung Galaxy A52 5G Silver 256GB",
        stock: 35,
        price: 549.99,
        image: "samsung_galaxy_a52_5g_silver_256gb.png",
        variations: {
          "Color": "#C0C0C0",
          "Storage": "256GB",
        },
      ),
      SKU(
        id: "23-3",
        description: "Samsung Galaxy A52 5G Pink 128GB",
        stock: 30,
        price: 499.99,
        image: "samsung_galaxy_a52_5g_pink_128gb.png",
        variations: {
          "Color": "#FFC0CB",
          "Storage": "128GB",
        },
      ),
    ],
  ),
   */
  /*
  Product(
    id: "25",
    name: "Sony WH-1000XM4 Wireless Noise Cancelling Headphones",
    stock: 80,
    price: 349.99,
    description: "The Sony WH-1000XM4 Wireless Noise Cancelling Headphones are the ultimate headphones for music and call lovers. They feature a 40mm driver, a HD noise cancelling processor, a adaptive sound control, and a ambient sound mode. They also have a wireless Bluetooth connection, a touch control, a voice assistant, and a 30-hour battery life. The Sony WH-1000XM4 Wireless Noise Cancelling Headphones offer a superb sound quality, a effective noise cancellation, and a comfortable fit.",
    brandId: "4",
    brandName: "Sony",
    categoryId: "11",
    parentCategoryId: "1",
    isFeatured: true,
    images: ["sony_wh_1000xm4_wireless_noise_cancelling_headphones_1.png", "sony_wh_1000xm4_wireless_noise_cancelling_headphones_2.png", "sony_wh_1000xm4_wireless_noise_cancelling_headphones_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#000000", "#C0C0C0"],
      ),
    ],
    skus: [
      SKU(
        id: "25-1",
        description: "Sony WH-1000XM4 Wireless Noise Cancelling Headphones Black",
        stock: 50,
        price: 349.99,
        image: "sony_wh_1000xm4_wireless_noise_cancelling_headphones_black.png",
        variations: {
          "Color": "#000000",
        },
      ),
      SKU(
        id: "25-2",
        description: "Sony WH-1000XM4 Wireless Noise Cancelling Headphones Silver",
        stock: 30,
        price: 349.99,
        image: "sony_wh_1000xm4_wireless_noise_cancelling_headphones_silver.png",
        variations: {
          "Color": "#C0C0C0",
        },
      ),
    ],
  ),
  Product(
    id: "26",
    name: "Sony Alpha a7 III Mirrorless Digital Camera",
    stock: 60,
    price: 1999.99,
    description: "The Sony Alpha a7 III Mirrorless Digital Camera is the ultimate camera for photography and videography lovers. It features a 24.2MP full-frame Exmor R CMOS sensor, a BIONZ X image processor, a 693-point hybrid AF system, a 5-axis SteadyShot INSIDE stabilization, and a 4K UHD video recording. It also has a 3-inch tilting touchscreen LCD, a 2.36m-dot OLED electronic viewfinder, a dual SD card slots, and a NP-FZ100 battery. The Sony Alpha a7 III Mirrorless Digital Camera offers a stunning image quality, a fast performance, and a versatile design.",
    brandId: "4",
    brandName: "Sony",
    categoryId: "1",
    parentCategoryId: "1",
    isFeatured: true,
    images: ["sony_alpha_a7_iii_mirrorless_digital_camera_1.png", "sony_alpha_a7_iii_mirrorless_digital_camera_2.png", "sony_alpha_a7_iii_mirrorless_digital_camera_3.png"],
    productAttributeModels: [],
    skus: [],
  ),
   */

  Product(
    id: "31",
    name: "Zara Women's Faux Leather Biker Jacket",
    stock: 80,
    price: 69.90,
    discountPercent: 15,
    description: "The Zara Women's Faux Leather Biker Jacket is the ultimate jacket for edgy and chic lovers. It features a faux leather fabric, a lapel collar, a zip fastening, a belt, and a four-pocket design. It also has a quilted detail on the shoulders, a zipped cuffs, and a variety of colors to choose from. The Zara Women's Faux Leather Biker Jacket is a trendy and versatile, suitable for any occasion.",
    brandId: "13",
    brandName: "Zara",
    categoryId: "14",
    isFeatured: false,
    images: ["zara_womens_faux_leather_biker_jacket_1.png", "zara_womens_faux_leather_biker_jacket_2.png", "zara_womens_faux_leather_biker_jacket_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#000000", "#964B00", "#FF0000", "#008000", "#FFC0CB"],
      ),
      ProductAttributeModel(
        name: "Size",
        values: ["XS", "S", "M", "L", "XL"],
      ),
    ],

    skus: [
      SKU(
        id: "31-1",
        description: "Zara Women's Faux Leather Biker Jacket Black Size XS",
        stock: 20,
        price: 69.90,
        image: "zara_womens_faux_leather_biker_jacket_black_size_xs.png",
        variations: {
          "Color": "#000000",
          "Size": "XS",
        },
      ),
      SKU(
        id: "31-2",
        description: "Zara Women's Faux Leather Biker Jacket Brown Size S",
        stock: 15,
        price: 69.90,
        image: "zara_womens_faux_leather_biker_jacket_brown_size_s.png",
        variations: {
          "Color": "#964B00",
          "Size": "S",
        },
      ),
      SKU(
        id: "31-3",
        description: "Zara Women's Faux Leather Biker Jacket Red Size M",
        stock: 10,
        price: 69.90,
        image: "zara_womens_faux_leather_biker_jacket_red_size_m.png",
        variations: {
          "Color": "#FF0000",
          "Size": "M",
        },
      ),
    ],
      parentCategoryId: '2'
  ),
  Product(
    id: "32",
    name: "Zara Men's Slim Fit Chino Pants",
    stock: 120,
    price: 49.90,
    description: "The Zara Men's Slim Fit Chino Pants are the ultimate pants for casual and smart lovers. They feature a cotton and elastane fabric, a zip and button fastening, a four-pocket design, and a belt loops. They also have a slim fit, a regular waist, and a variety of colors to choose from. The Zara Men's Slim Fit Chino Pants are a classic and comfortable, suitable for any occasion.",
    brandId: "13",
    brandName: "Zara",
    categoryId: "13",
    isFeatured: false,
    images: ["zara_mens_slim_fit_chino_pants_1.png", "zara_mens_slim_fit_chino_pants_2.png", "zara_mens_slim_fit_chino_pants_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#000000", "#C0C0C0", "#964B00", "#0000FF", "#008000"],
      ),
      ProductAttributeModel(
        name: "Size",
        values: ["28", "30", "32", "34", "36"],
      ),
    ],
    skus: [
      SKU(
        id: "32-1",
        description: "Zara Men's Slim Fit Chino Pants Black Size 28",
        stock: 30,
        price: 49.90,
        image: "zara_mens_slim_fit_chino_pants_black_size_28.png",
        variations: {
          "Color": "#000000",
          "Size": "28",
        },
      ),
      SKU(
        id: "32-2",
        description: "Zara Men's Slim Fit Chino Pants Grey Size 30",
        stock: 25,
        price: 49.90,
        image: "zara_mens_slim_fit_chino_pants_grey_size_30.png",
        variations: {
          "Color": "#C0C0C0",
          "Size": "30",
        },
      ),
      SKU(
        id: "32-3",
        description: "Zara Men's Slim Fit Chino Pants Brown Size 32",
        stock: 20,
        price: 49.90,
        image: "zara_mens_slim_fit_chino_pants_brown_size_32.png",
        variations: {
          "Color": "#964B00",
          "Size": "32",
        },
      ),
    ], parentCategoryId: '2',
  ),
  Product(
    id: "33",
    name: "Zara Kids' Printed Sweatshirt",
    stock: 150,
    price: 29.90,
    description: "The Zara Kids' Printed Sweatshirt is the ultimate sweatshirt for fun and cozy lovers. It features a cotton and polyester fabric, a round neck, a long sleeve, and a ribbed trim. It also has a printed design on the front, a Zara logo on the back, and a variety of colors and prints to choose from. The Zara Kids' Printed Sweatshirt is a cute and comfy, suitable for any occasion.",
    brandId: "13",
    brandName: "Zara",
    categoryId: "16",
    isFeatured: false,
    images: ["zara_kids_printed_sweatshirt_1.png", "zara_kids_printed_sweatshirt_2.png", "zara_kids_printed_sweatshirt_3.png"],
    productAttributeModels: [
      ProductAttributeModel(
        name: "Color",
        values: ["#000000", "#FFC0CB", "#FFFF00", "#0000FF", "#FF0000"],
      ),
      ProductAttributeModel(
        name: "Print",
        values: ["Dinosaur", "Unicorn", "Robot", "Flower", "Star"],
      ),
      ProductAttributeModel(
        name: "Size",
        values: ["2-3", "4-5", "6-7", "8-9", "10-11"],
      ),
    ],
    skus: [
      SKU(
        id: "33-1",
        description: "Zara Kids' Printed Sweatshirt Black Dinosaur Size 2-3",
        stock: 35,
        price: 29.90,
        image: "zara_kids_printed_sweatshirt_black_dinosaur_size_2_3.png",
        variations: {
          "Color": "#000000",
          "Print": "Dinosaur",
          "Size": "2-3",
        },
      ),
      SKU(
        id: "33-2",
        description: "Zara Kids' Printed Sweatshirt Pink Unicorn Size 4-5",
        stock: 30,
        price: 29.90,
        image: "zara_kids_printed_sweatshirt_pink_unicorn_size_4_5.png",
        variations: {
          "Color": "#FFC0CB",
          "Print": "Unicorn",
          "Size": "4-5",
        },
      ),
      SKU(
        id: "33-3",
        description: "Zara Kids' Printed Sweatshirt Yellow Robot Size 6-7",
        stock: 25,
        price: 29.90,
        image: "zara_kids_printed_sweatshirt_yellow_robot_size_6_7.png",
        variations: {
          "Color": "#FFFF00",
          "Print": "Robot",
          "Size": "6-7",
        },
      ),
    ], parentCategoryId: '3',
  ),
];