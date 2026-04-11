import { defineConfig } from "vitepress";
import { withSidebar } from "vitepress-sidebar";

export default withSidebar(
  defineConfig({
    title: "Myriad",
    description: "The Myriad General Validity Test",
    base: "/Myriad/",
    themeConfig: {
      logo: "/logo.svg",
      nav: [
        { text: "Getting Started", link: "/getting-started/" },
        { text: "API", link: "/api/" },
      ],
      search: { provider: "local" },
      socialLinks: [
        { icon: "github", link: "https://github.com/Standard-2/Myriad" },
      ],
    },
    head: [["link", { rel: "icon", href: "/Myriad/favicon.ico" }]],
  }),
  {
    // ============ [ SIDEBAR OPTIONS ] ============
    useFolderLinkFromIndexFile: true,
    useFolderTitleFromIndexFile: true,
    useTitleFromFileHeading: true,
    useTitleFromFrontmatter: true,
    hyphenToSpace: true,
    sortMenusByFrontmatterOrder: true,
    frontmatterOrderDefaultValue: 100,
    excludeByGlobPattern: ["**/test/**"],
    collapsed: true,
  },
);
