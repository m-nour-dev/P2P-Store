import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/core/theme/app_colors.dart';
import 'package:p2p_store/features/products/presentation/manager/toggle_favorite_cart_cubit.dart';
import 'package:p2p_store/features/products/presentation/widgets/page_bottom_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:p2p_store/core/constants/app_constant.dart';
import 'package:p2p_store/features/products/data/models/product_models.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showReviews = false;
  final TextEditingController reviewController = TextEditingController();
  int activeImageIndex = 0; // ✅ لمؤشر الصورة النشطة
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  // ✅ تحكم بالـ Carousel

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
        appBar: AppBar(
          title: Text(p.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Carousel للصور
              if (p.images != null && p.images!.isNotEmpty)
                Column(
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                          items: p.images!
                              .map(
                                (url) => ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                      color: Colors.grey[300],
                                      child:
                                          const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: 320,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            onPageChanged: (index, reason) {
                              setState(() => activeImageIndex = index);
                            },
                          ),
                          carouselController: _carouselController,
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    AnimatedSmoothIndicator(
                      activeIndex: activeImageIndex,
                      count: p.images!.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 6,
                        expansionFactor: 4,
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor: Colors.grey.shade400,
                      ),
                      onDotClicked: (index) {
                        _carouselController.animateToPage(index);
                      },
                    ),
                  ],
                )
              else
                Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.image_not_supported)),
                ),
      
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ الاسم والسعر
                    Text(
                      p.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "${AppConstants.currency} ${p.price}",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (p.discountPercentage != null)
                          Text(
                            "${AppConstants.currency}${p.discountPercentage}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
      
                    // ✅ التقييم
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < p.rating!.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
      
                    // ✅ الوصف
                    if (p.description != null)
                      Text(
                        p.description!,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
      
                    const Divider(height: 30),
      
                    // ✅ التفاصيل الثانوية
                    if (p.brand != null) Text("Brand: ${p.brand}"),
                    if (p.warrantyInformation != null)
                      Text("Warranty: ${p.warrantyInformation}"),
                    if (p.shippingInformation != null)
                      Text("Shipping: ${p.shippingInformation}"),
                    if (p.returnPolicy != null)
                      Text("Return Policy: ${p.returnPolicy}"),
      
                    const Divider(height: 30),
      
                    // ✅ الريفيوز
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            showReviews
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                          onPressed: () {
                            setState(() => showReviews = !showReviews);
                          },
                        ),
                      ],
                    ),
                    if (showReviews) ...[
                      if (p.reviews != null && p.reviews!.isNotEmpty)
                        Column(
                          children: p.reviews!
                              .map((r) => ListTile(
                                    title: Text(r.reviewerName ?? "Anonymous"),
                                    subtitle: Text(r.comment ?? ""),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index < (r.rating?.round() ?? 0)
                                              ? Icons.star
                                              : Icons.star_border,
                                          size: 16,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      else
                        const Text("No reviews yet."),
                      const SizedBox(height: 12),
                      TextField(
                        controller: reviewController,
                        decoration: InputDecoration(
                          hintText: "Write your review...",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              if (reviewController.text.isNotEmpty) {
                                // 1️⃣ إنشاء كائن review جديد
                                final newReview = Review(
                                  reviewerName: "You", // أو اسم المستخدم الحالي
                                  comment: reviewController.text,
                                  rating: 5, // أو أي قيمة تحددها حسب التقييم
                                );
      
                                // 2️⃣ إضافة الريفيو الجديد إلى قائمة الريفيوز
                                if (p.reviews != null) {
                                  p.reviews!
                                      .insert(0, newReview); // نضيفه في البداية
                                } else {
                                  p.reviews = [newReview]; // لو كانت null
                                }
      
                                // 3️⃣ إعادة بناء الواجهة لتظهر الريفيوز الجديدة
                                setState(() {});
      
                                // 4️⃣ مسح النص وإظهار Snackbar
                                reviewController.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Review submitted!")),
                                );
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 10),
              PageBottomSection(),
            ],
          ),
        ),
      
        // ✅ البار السفلي (Add to Cart)
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onTertiary,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppConstants.currency} ${p.price}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ToggleFavoriteCartCubit>().addToCart(p);
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
