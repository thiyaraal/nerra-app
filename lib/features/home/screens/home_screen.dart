import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/constants/color_styles.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/image_collection.dart';
import 'package:narra_apps/core/constants/text_styles.dart';
import 'package:narra_apps/core/helpers/app_routes.dart';
import 'package:narra_apps/core/helpers/paths.dart';
import 'package:narra_apps/core/widgets/card_image.dart';
import 'package:narra_apps/core/widgets/logo_card.dart';
import 'package:narra_apps/core/widgets/profile_card.dart';
import 'package:narra_apps/features/auth/login/cubit/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,

        titleSpacing: 20,
        title: const LogoCard(),
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Logout',
                style: AppTextStyles.medium(
                  FontSizes.lg,
                ).copyWith(color: Colors.red),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Start you story with Narra today',
                style: AppTextStyles.medium(FontSizes.md),
              ),
              const SizedBox(height: 4),
              Text(
                'Because every voice deserves to be heard.',
                style: AppTextStyles.regular(FontSizes.md),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: CardImage(
                        onTap: () => context.go(Paths.detailStories),
                        image: ImageCollection.bunga,
                        title: 'Thiyaraal',
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              Text(
                ' Poplar Stories',
                style: AppTextStyles.medium(FontSizes.lg),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorStyles.primary,
                            boxShadow: [
                              BoxShadow(
                                color: ColorStyles.primary.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () => context.go(Paths.addStories),
                            icon: const Icon(Icons.add, color: Colors.white),
                            iconSize: 32,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          'Add Story',
                          style: AppTextStyles.regular(
                            FontSizes.md,
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    ProfileCard(
                      image:
                          'https://0.academia-photos.com/175720526/90153614/78884964/s200_thiyara.al-_mawaddah.jpeg',
                      name: 'Thiyaraal',
                    ),
                    const SizedBox(width: 20),
                    ProfileCard(
                      image:
                          'https://0.academia-photos.com/175720526/90153614/78884964/s200_thiyara.al-_mawaddah.jpeg',
                      name: 'Thiyaraal',
                    ),
                    const SizedBox(width: 20),
                    ProfileCard(
                      image:
                          'https://0.academia-photos.com/175720526/90153614/78884964/s200_thiyara.al-_mawaddah.jpeg',
                      name: 'Thiyaraal',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
