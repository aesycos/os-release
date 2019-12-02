#!/bin/bash

FILE=/etc/os-release

function query_file()
{
    cat $FILE | grep $1
}

while [ -n "$1" ]; do
    case "$1" in
    -a) query_file ^ANSI_COLOR ;;
    -b) query_file ^BUILD_ID ;;
    -B) query_file ^BUG_REPORT_URL ;;
    -c) query_file ^VERSION_CODENAME ;;
    -C) query_file ^CPE_NAME ;;
    -d) query_file ^DOCUMENTATION_URL ;;
    -h) echo "usgae: os-release [OPTIONS]

  DESCRIPTION
    Displays back information found in either /etc/os-release or
    /usr/lib/os-release

    The file /etc/os-release takes precedence over /usr/lib/os-release. This
    script will check for the former, and exclusively use its data if it
    exists, and only fall back to /usr/lib/os-release if it is missing.

  OPTIONS
    -a  ANSI_COLOR A suggested presentation color when showing the OS name on
        the console. This should be specified as string suitable for inclusion
        in the ESC [ m ANSI/ECMA-48 escape code for setting graphical
        rendition. This field is optional. Example: \"ANSI_COLOR=\"0;31\"\" for
        red, or \"ANSI_COLOR=\"1;34\"\" for light blue.

    -b  BUILD_ID A string uniquely identifying the system image used as the
        origin for a distribution (it is not updated with system updates). The
        field can be identical between different VERSION_IDs as BUILD_ID is an
        only a unique identifier to a specific version. Distributions that
        release each update as a new version would only need to use VERSION_ID
        as each build is already distinct based on the VERSION_ID. This field is
        optional. Example: \"BUILD_ID=\"2013-03-20.3\"\" or
        \"BUILD_ID=201303203\".

    -B  BUG_REPORT_URL should refer to the main bug reporting page for the
        operating system, if there is any. This is primarily intended for
        operating systems that rely on community QA.

    -c  VERSION_CODENAME A lower-case string (no spaces or other characters
        outside of 0–9, a–z, \".\", \"_\" and \"-\") identifying the operating
        system release code name, excluding any OS name information or release
        version, and suitable for processing by scripts or usage in generated
        filenames. This field is optional and may not be implemented on all
        systems. Examples: \"VERSION_CODENAME=buster\",
        \"VERSION_CODENAME=xenial\"

    -C  CPE_NAME A CPE name for the operating system, in URI binding syntax,
        following the Common Platform Enumeration Specification as proposed
        by the NIST. This field is optional.
        Example: \"CPE_NAME=\"cpe:/o:fedoraproject:fedora:17\"

    -d  DOCUMENTATION_URL should refer to the main documentation page for this
        operating system.

    -h  This help information

    -i  ID A lower-case string (no spaces or other characters outside of 0–9,
        a–z, \".\", \"_\" and \"-\") identifying the operating system, excluding
        any version information and suitable for processing by scripts or usage
        in generated filenames. If not set, defaults to "ID=linux". Example:
        \"ID=fedora\" or \"ID=debian\".

    -l  ID_LIKE A space-separated list of operating system identifiers in the
        same syntax as the ID= setting. It should list identifiers of operating
        systems that are closely related to the local operating system in
        regards to packaging and programming interfaces, for example listing one
        or more OS identifiers the local OS is a derivative from. An OS should
        generally only list other OS identifiers it itself is a derivative of,
        and not any OSes that are derived from it, though symmetric
        relationships are possible. Build scripts and similar should check this
        variable if they need to identify the local operating system and the
        value of ID= is not recognized. Operating systems should be listed in
        order of how closely the local operating system relates to the listed
        ones, starting with the closest. This field is optional. Example: for an
        operating system with \"ID=centos\", an assignment of \"ID_LIKE=\"rhel
        fedora\"\" would be appropriate. For an operating system with
        \"ID=ubuntu\", an assignment of \"ID_LIKE=debian\" is appropriate.

    -L  LOGO a string, specifying the icon name of the distributions logo.

    -n  NAME A string identifying the operating system, without a version
        component, and suitable for presentation to the user. If not set,
        defaults to \"NAME=Linux\". Example: \"NAME=Fedora\" or 
        \"NAME=\"Debian GNU/Linux\"\".

    -p  PRETTY_NAME A pretty operating system name in a format suitable for
        presentation to the user. May or may not contain a release code name or
        OS version of some kind, as suitable. If not set, defaults to
        \"PRETTY_NAME=\"Linux\"\". Example: \"PRETTY_NAME=\"Fedora 17
        (Beefy Miracle)\"\".

    -P  PRIVAY_POLICY_URL should refer to the main privacy policy page for the
        operating system, if there is any. 

    -r  VARIANT A string identifying a specific variant or edition of the
        operating system suitable for presentation to the user. This field may
        be used to inform the user that the configuration of this system is
        subject to a specific divergent set of rules or default configuration
        settings. This field is optional and may not be implemented on all
        systems. Examples: \"VARIANT=\"Server Edition\"\",
        \"VARIANT=\"Smart Refrigerator Edition\"\" Note: this field is for
        display purposes only. The VARIANT_ID field should be used for making
        programmatic decisions.

    -R  VARIANT_ID A lower-case string (mostly numeric, no spaces or other
        characters outside of 0–9, a–z, \".\", \"_\" and \"-\") identifying the
        operating system version, excluding any OS name information or release
        code name, and suitable for processing by scripts or usage in generated
        filenames. This field is optional. Example: \"VERSION_ID=17\" or
        \"VERSION_ID=11.04\".
    
    -s  SUPPORT_URL should refer to the main support page for the operating
        system, if there is any. This is primarily intended for operating
        systems which vendors provide support for.

    -u  HOME_URL should refer to the homepage of the operating system, or
        alternatively some homepage of the specific version of the operating
        system.

    -v  VERSION A string identifying the operating system version, excluding any
        OS name information, possibly including a release code name, and
        suitable for presentation to the user. This field is optional. Example:
        \"VERSION=17\" or \"VERSION=\"17 (Beefy Miracle)\"\".
  URLS
    These URLs are intended to be exposed in \"About this system\" UIs behind
    links with captions such as \"About this Operating System\", \"Obtain
    Support\", \"Report a Bug\", or \"Privacy Policy\". The values should be in
    RFC3986 format, and should be \"http:\" or \"https:\" URLs, and possibly
    \"mailto:\" or \"tel:\". Only one URL shall be listed in each setting. If
    multiple resources need to be referenced, it is recommended to provide an
    online landing page linking all available resources. Examples:
    \"HOME_URL=\"https://fedoraproject.org/\"\" and
    \"BUG_REPORT_URL=\"https://bugzilla.redhat.com/\"

  MORE INFORMATION:
    os-release:
      <https://www.freedesktop.org/software/systemd/man/os-release.html> 

    Icon Theme Specification:
      <http://standards.freedesktop.org/icon-theme-spec/latest>

    URL Format:
      <https://tools.ietf.org/html/rfc3986>
    ";;



    -i) query_file ^ID ;;
    -l) query_file ^ID_LIKE ;;
    -L) query_file ^LOGO ;;
    -n) query_file ^NAME ;;
    -p) query_file ^PRETTY_NAME ;;
    -P) query_file ^PRIVACY_POLICY_URL ;;
    -r) query_file ^VARIANT ;;
    -R) query_file ^VARIANT_ID ;;
    -s) query_file ^SUPPORT_URL ;;
    -u) query_file ^HOME_URL ;;
    -v) query_file ^VERSION ;;
    *) echo "Option $1 not recognized" ;;
    esac
    shift
done
