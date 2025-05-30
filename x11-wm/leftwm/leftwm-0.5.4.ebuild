# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	aho-corasick@1.1.3
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.95
	anymap2@0.13.0
	autocfg@1.4.0
	backtrace@0.3.74
	base64@0.21.7
	bitflags@2.8.0
	block-buffer@0.10.4
	bytes@1.10.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	clap@4.5.28
	clap_builder@4.5.27
	clap_lex@0.7.4
	colorchoice@1.0.3
	const_format@0.2.34
	const_format_proc_macros@0.2.34
	cpufeatures@0.2.17
	crossbeam-channel@0.5.14
	crossbeam-utils@0.8.21
	crypto-common@0.1.6
	deranged@0.3.11
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.4.1
	dirs@5.0.1
	either@1.13.0
	equivalent@1.0.1
	errno@0.3.10
	fastrand@2.3.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	getrandom@0.3.1
	gimli@0.31.1
	git-version-macro@0.3.9
	git-version@0.3.9
	hashbrown@0.15.2
	indexmap@2.7.1
	inventory@0.3.19
	is_terminal_polyfill@1.70.1
	itertools@0.14.0
	itoa@1.0.14
	kstring@2.0.2
	lazy_static@1.5.0
	lefthk-core@0.2.2
	leftwm-layouts@0.9.1
	libc@0.2.169
	libredox@0.1.3
	linux-raw-sys@0.4.15
	liquid-core@0.26.11
	liquid-derive@0.26.10
	liquid-lib@0.26.11
	liquid@0.26.11
	log@0.4.25
	matchers@0.1.0
	memchr@2.7.4
	miniz_oxide@0.8.3
	mio@1.0.3
	nix@0.29.0
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num_threads@0.1.7
	object@0.36.7
	once_cell@1.20.2
	option-ext@0.2.0
	overload@0.1.1
	percent-encoding@2.3.1
	pest@2.7.15
	pest_derive@2.7.15
	pest_generator@2.7.15
	pest_meta@2.7.15
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkg-config@0.3.31
	powerfmt@0.2.0
	proc-macro2@1.0.93
	quote@1.0.38
	redox_users@0.4.6
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	ron@0.8.1
	rustc-demangle@0.1.24
	rustix@0.38.44
	rustversion@1.0.19
	ryu@1.0.19
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.138
	serde_spanned@0.6.8
	sha2@0.10.8
	sharded-slab@0.1.7
	shellexpand@3.1.0
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.8
	static_assertions@1.1.0
	strsim@0.11.1
	syn@2.0.98
	syslog-tracing@0.3.1
	tempfile@3.16.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tokio-macros@2.5.0
	tokio@1.43.0
	toml@0.8.20
	toml_datetime@0.6.8
	toml_edit@0.22.23
	tracing-appender@0.2.3
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-journald@0.3.1
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	typenum@1.17.0
	ucd-trie@0.1.7
	unicode-ident@1.0.16
	unicode-segmentation@1.12.0
	unicode-xid@0.2.6
	utf8parse@0.2.2
	valuable@0.1.1
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.7.1
	wit-bindgen-rt@0.33.0
	x11-dl@2.21.0
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xdg@2.5.2
"

RUST_MIN_VER="1.83.0"

inherit cargo

DESCRIPTION="A window manager for Adventurers"
HOMEPAGE="https://github.com/leftwm/leftwm"
SRC_URI="
	https://github.com/leftwm/leftwm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD MIT MPL-2.0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+lefthk syslog systemd x11rb"

DEPEND="
	x11-apps/xrandr
	x11-libs/libX11
	x11-libs/libXinerama
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/.*"

src_configure() {
	local myfeatures=(
		$(usev lefthk)
		$(usev systemd journald-log)
		$(usev syslog sys-log)
		$(usev x11rb)
		xlib
	)
	cargo_src_configure --no-default-features
}

src_install() {
	dodoc -r README.md CHANGELOG.md
	doman leftwm/doc/leftwm.1

	insinto /usr/share/xsessions
	doins leftwm.desktop

	dobin "$(cargo_target_dir)"/leftwm{,-log,-worker,-state,-check,-command}
	use lefthk && dobin "$(cargo_target_dir)"/lefthk-worker
}
