cask "eclipse-platform" do
  version "4.18,202012021800"
  sha256 "57e6b02c31179470fef4edd5f62cdf323fefc166315f7736147ba05798577381"

  url "https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops#{version.major}/R-#{version.before_comma}-#{version.after_comma}/eclipse-SDK-#{version.before_comma}-macosx-cocoa-x86_64.dmg&r=1"
  name "Eclipse SDK"
  homepage "https://eclipse.org/"

  livecheck do
    url "http://download.eclipse.org/eclipse/downloads/"
    regex(%r{href=.*/R-(\d+(?:\.\d+)*)-(\d+)/}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  # Renamed to avoid conflict with other Eclipse.
  app "Eclipse.app", target: "Eclipse Platform.app"
end
