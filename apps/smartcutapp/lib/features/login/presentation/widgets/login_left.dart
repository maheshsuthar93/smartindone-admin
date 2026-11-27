import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class LoginLeftPanel extends StatelessWidget {
  const LoginLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/factory_bg.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: .35),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor.withValues(alpha: .8),
              AppColors.primaryColor.withValues(alpha: .7),
              AppColors.primaryColor.withValues(alpha: .6),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),

                /// Heading
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.displaySmall
                        .responsive(context)
                        .regular,
                    children: [
                      TextSpan(
                        text: "One Platform.\n",
                        style: TextStyle(color: AppColors.secondaryColor),
                      ),
                      TextSpan(
                        text: "Your Whole Business.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  "SmartIndOne brings your teams, operations and business "
                  "workflows together in one platform, built to adapt across "
                  "industries.",
                  style: AppTextStyle.bodyMedium
                      .responsive(context)
                      .regular
                      .copyWith(color: Colors.white70),
                ),

                const SizedBox(height: 55),

                const _FeatureTile(
                  icon: Icons.auto_graph_rounded,
                  title: "Smart Optimization",
                  subtitle:
                      "Advanced algorithms for better cutting and less waste.",
                ),

                SizedBox(height: 30),

                _FeatureTile(
                  icon: Icons.factory_outlined,
                  title: "Real-time Production",
                  subtitle:
                      "Track orders, boards and machine status in real time.",
                ),

                SizedBox(height: 30),

                _FeatureTile(
                  icon: Icons.inventory_2_outlined,
                  title: "Inventory Management",
                  subtitle: "Manage sheets, offcuts and hardware with complete control.",
                ),

                SizedBox(height: 30),

                _FeatureTile(
                  icon: Icons.local_shipping_outlined,
                  title: "Timely Deliveries",
                  subtitle: "Streamline shipments and keep your promises.",
                ),

                const Spacer(),

                const Divider(color: Colors.white24),

                const SizedBox(height: 20),

                Row(
                  children: const [
                    Icon(Icons.verified_user, color: AppColors.secondaryColor),

                    SizedBox(width: 12),

                    Text("Secure", style: TextStyle(color: Colors.white70)),

                    SizedBox(width: 12),

                    Text("•", style: TextStyle(color: Colors.white38)),

                    SizedBox(width: 12),

                    Text("Reliable", style: TextStyle(color: Colors.white70)),

                    SizedBox(width: 12),

                    Text("•", style: TextStyle(color: Colors.white38)),

                    SizedBox(width: 12),

                    Text("Efficient", style: TextStyle(color: Colors.white70)),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),

        const SizedBox(width: 22),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.titleSmall
                    .responsive(context)
                    .bold
                    .copyWith(color: Colors.white),
              ),

              const SizedBox(height: 8),

              Text(
                subtitle,
                style: AppTextStyle.bodySmall
                    .responsive(context)
                    .regular
                    .copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
