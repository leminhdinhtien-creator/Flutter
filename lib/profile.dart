import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color _pageBackground = Color(0xFFF8FAFC);
  static const Color _textPrimary = Color(0xFF111827);
  static const Color _textSecondary = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBackground,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: SingleChildScrollView(
              key: const Key('profile-scroll'),
              padding: const EdgeInsets.fromLTRB(28, 16, 28, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ProfileTopBar(),
                  const SizedBox(height: 22),
                  const _ProfileHeader(),
                  const SizedBox(height: 22),
                  const _StatisticsCard(),
                  const SizedBox(height: 24),
                  const _SectionTitle('About Me'),
                  const SizedBox(height: 8),
                  const Text(
                    'Passionate Lead Mobile Engineer specialized in Flutter, Dart, '
                    'and building high-performance cross-platform applications. '
                    'Focused on elegant user experiences and clean architecture.',
                    style: TextStyle(
                      color: _textSecondary,
                      fontSize: 14,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const _SectionTitle('Skills & Expertise'),
                  const SizedBox(height: 10),
                  const Wrap(
                    spacing: 9,
                    runSpacing: 10,
                    children: [
                      _SkillChip(
                        label: 'Flutter',
                        icon: Icons.flutter_dash_rounded,
                        backgroundColor: Color(0xFFDFF6FD),
                        foregroundColor: Color(0xFF168FB5),
                      ),
                      _SkillChip(
                        label: 'Dart',
                        icon: Icons.code_rounded,
                        backgroundColor: Color(0xFFDFF8E9),
                        foregroundColor: Color(0xFF23975B),
                      ),
                      _SkillChip(
                        label: 'Clean Arch',
                        icon: Icons.layers_outlined,
                        backgroundColor: Color(0xFFFFE5E8),
                        foregroundColor: Color(0xFFD94867),
                      ),
                      _SkillChip(
                        label: 'UI/UX',
                        icon: Icons.design_services_outlined,
                        backgroundColor: Color(0xFFF1E7FF),
                        foregroundColor: Color(0xFF7C3AED),
                      ),
                      _SkillChip(
                        label: 'Firebase',
                        icon: Icons.local_fire_department_outlined,
                        backgroundColor: Color(0xFFFFF0C7),
                        foregroundColor: Color(0xFFB66C08),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('Featured Projects'),
                  const SizedBox(height: 12),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _ProjectCard(
                          title: 'E-Shop Flutter',
                          subtitle: 'Mobile App · 2026',
                          imagePath: 'images/david-laid2.jpg',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _ProjectCard(
                          title: 'Crypto Vault',
                          subtitle: 'Finance · Clean Arch',
                          imagePath: 'images/david-laid3.webp',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _ContactCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('profile-top-bar'),
      height: 44,
      child: Row(
        children: const [
          _TopBarIcon(icon: Icons.arrow_back_ios_new_rounded),
          Expanded(
            child: Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  color: ProfilePage._textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          _TopBarIcon(icon: Icons.share_outlined),
        ],
      ),
    );
  }
}

class _TopBarIcon extends StatelessWidget {
  const _TopBarIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8EDF3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x080F172A),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon, size: 19, color: ProfilePage._textPrimary),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                key: const Key('profile-avatar'),
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFF8A5C), Color(0xFFFFC857)],
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'images/david-laid.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 7,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0EA5E9),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Đình Tiến',
            style: TextStyle(
              color: ProfilePage._textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              color: ProfilePage._textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 17,
                  color: ProfilePage._textSecondary,
                ),
                SizedBox(width: 5),
                Text(
                  'Hồ Chí Minh, Việt Nam',
                  style: TextStyle(
                    color: ProfilePage._textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  const _StatisticsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('profile-statistics'),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 22,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(
            child: _StatItem(value: '10', label: 'Projects'),
          ),
          _VerticalDivider(),
          Expanded(
            child: _StatItem(value: '10 Yrs', label: 'Experience'),
          ),
          _VerticalDivider(),
          Expanded(
            child: _StatItem(
              value: '4.9 ★',
              label: 'Rating',
              valueColor: Color(0xFFF2B705),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 42, color: const Color(0xFFE8EDF3));
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    this.valueColor = ProfilePage._textPrimary,
  });

  final String value;
  final String label;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: ProfilePage._textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: foregroundColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey<String>('project-card-$title'),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            key: ValueKey<String>('project-image-$title'),
            aspectRatio: 1.9,
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 10, 11, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfilePage._textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfilePage._textSecondary,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Icon(
                  Icons.alternate_email_rounded,
                  size: 22,
                  color: ProfilePage._textPrimary,
                ),
                SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'Contact Information',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ProfilePage._textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Color(0xFFE8EDF3)),
          _ContactRow(
            icon: Icons.mail_outline_rounded,
            text: 'leminhdinhtien@email.com',
          ),
          Divider(height: 1, indent: 49, color: Color(0xFFE8EDF3)),
          _ContactRow(
            icon: Icons.phone_outlined,
            text: '+84 356 569 446',
            showArrow: false,
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.text,
    this.showArrow = true,
  });

  final IconData icon;
  final String text;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 21, color: ProfilePage._textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: ProfilePage._textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (showArrow)
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }
}
