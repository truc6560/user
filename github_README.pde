String[][] strs = new String[6][2];
PFont font;

void setup() {
  size(1920, 1080);
  font = createFont("HelveticaNeue-48.vlw", 48);
  textFont(font);
  frameRate(30);
  textAlign(CENTER);
  textSize(40);
  background(255);
  fill(0);

  // Slide 1: Giới thiệu tên
  strs[0][0] = "Hello, world!";
  strs[0][1] = "My name is Nguyen Ngoc Bao Truc.";

  // Slide 2: Ngành học và nơi ở
  strs[1][0] = "I'm a Management Information Systems student";
  strs[1][1] = "based in Ho Chi Minh City, Vietnam.";

  // Slide 3: Kỹ năng chuyên môn
  strs[2][0] = "I specialize in UI/UX Design & Web Development.";
  strs[2][1] = "I work with Figma, Laravel, PHP, and MySQL.";

  // Slide 4: Điểm mạnh (AI & System Logic)
  strs[3][0] = "I love combining system logic with visual hierarchy,";
  strs[3][1] = "and leveraging AI tools to accelerate design workflows.";

  // Slide 5: Lời mời xem Portfolio/GitHub (Đã thêm phần bị thiếu để tránh lỗi)
  strs[4][0] = "I've created music platforms and digital assets.";
  strs[4][1] = "You can find my projects right here on my GitHub!";

  // Slide 6: Thông tin liên hệ
  strs[5][0] = "Feel free to reach out to say hi!";
  strs[5][1] = "Phone: 0966617581 | Email: baotruc272@gmail.com";
}

int i = 0;
boolean delete = false;
int s = 0;
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;


void draw() {
  background(255);

  if (s < strs.length) {
    if ((strs[s][0].length() >= i || strs[s][1].length() >= i) && !delete) {
      // Typing effect
      if (strs[s][0].length() >= i) {
        textSize(mainFontSize);
        text(strs[s][0].substring(0, i), width/2, height/2 - offset);
      } else {
        textSize(mainFontSize);
        text(strs[s][0], width/2, height/2 - offset);
      }
      
      if (strs[s][1].length() >= i) {
        textSize(secondaryFontSize);
        text(strs[s][1].substring(0, i), width/2, height/2 + offset);
      } else {
        textSize(secondaryFontSize);
        text(strs[s][1], width/2, height/2 + offset);
      }
      i++;
    } else {
      // Pause before deleting
      if (!delete) {
        delay(1500);
      }
      delete = true;
    }

    // Deleting effect
    if (delete) {
      if (i > 0) {
        if (i < strs[s][0].length()) {
          textSize(mainFontSize);
          text(strs[s][0].substring(0, i - 1), width/2, height/2 - offset);
        } else {
          textSize(mainFontSize);
          text(strs[s][0], width/2, height/2 - offset);
        }
        
        if (i < strs[s][1].length()) {
          textSize(secondaryFontSize);
          text(strs[s][1].substring(0, i - 1), width/2, height/2 + offset);
        } else {
          textSize(secondaryFontSize);
          text(strs[s][1], width/2, height/2 + offset);
        }
        i--;
      } else {
        // Move to next string
        delete = false;
        s++;
      }
    }
  }
}
