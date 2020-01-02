# CV_TeX
My Resume/CV

This is **Alice Twentysecond resume** modified to my needs:
- polish fonts handling (in polish version)
- slight changes in layout 
- added icons for LinkedIn and GitHub wepages linking
- added "startext" functionality allowing to show skill levels in number of stars in more freely way than "skills" or "skillstext"



![Resume](/master/foto.jpg)

As a source it is one-page CV design. I did not adjusted second (and further) page layout.

*\starskills{{name_skill/5},{name_skill2/1}}*

Starskills allows to set up skills in order. Each skill must be a couple {name/value}, where the value is an integer value between 1 and 5. The vaule correspond to legend on the end of the skill paragraph: 1 is a fundamental awarness, when 5 is an expert. In case when user does not want to show value: it can be space sign. The "_" underscore sign is equivalent of *\newline* command.
