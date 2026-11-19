# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 20/11/2026 06:15. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 53 mốc dự đoán, 52 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 44 | 428 đ | 743 đ | 91% |
| 2 | 42 | 918 đ | 974 đ | 88% |
| 3 | 41 | 1.093 đ | 1.232 đ | 88% |
| 4 | 40 | 1.403 đ | 1.370 đ | 80% |
| 5 | 40 | 1.547 đ | 1.620 đ | 82% |
| 6 | 40 | 1.684 đ | 1.862 đ | 85% |
| 7 | 44 | 1.885 đ | 2.016 đ | 80% |

### Lớp xu hướng chậm (ngày 2–7)

Từ `tv-close-gemini-v12` các ngày 2–7 cộng thêm 0,5 × mức đổi trung bình mỗi ngày trên 20 phiên của chính chuỗi giá. Trên 2 mốc lớp có lên tiếng (3 lần chấm ngày 2–7): sai số TB **4.251 đ**, nếu bỏ lớp **4.514 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 2) rồi mới kết luận.

### Ngày-1: mô hình so với đứng yên

Trên 52 lần đo: sai số TB **435 đ**, đứng yên **696 đ**, đúng chiều 73%, dải 90% phủ 92%.
→ Mô hình **đang thắng** mốc đứng yên (−261 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 45 | 82% | 684 đ | giúp (+249 đ) |
| dự đoán sàn London | 0 | — | 435 đ | chưa có tiếng nói |
| giá sàn đã chạy | 0 | — | 435 đ | chưa có tiếng nói |
| tín hiệu sàn | 0 | — | 435 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 435 đ | chưa có tiếng nói |
| AI điều tiết | 23 | 48% | 436 đ | giúp (+1 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 17 | 65% | 432 đ | hại (−3 đ) |
| đề xuất lệch sàn | 3 | 0% | 435 đ | không đổi |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Trên 2 lần có nhãn (2 lần khác "đi ngang"): đúng chiều 50%; sai số TB thật **244 đ**, nếu áp thêm lớp này **244 đ**.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 2) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lớp đang đo BÓNG: đà riêng trong nước (ngày đầu)

Chỉ ĐO, dự đoán không dùng: cộng 0,5 × trung bình phần lệch (giá thật − giá dự đoán) của 20 mốc đã chấm liền trước vào dự đoán ngày đầu.
Trên 2 mốc từ ngày 17/11/2026: sai số TB thật **1.710 đ**, nếu áp thêm lớp này **1.491 đ**.
Cả sổ (32 mốc, gồm những mốc đã dùng lúc chọn lớp — không dùng để kết luận): 528 đ so với 498 đ nếu áp.
Luật chốt trước: cần ≥ 20 mốc từ ngày 17/11/2026 (hiện 2) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lời đầu: dự đoán lúc giá vừa về, sàn London chưa có phiên mới

Từ `tv-close-gemini-v9` bản này lấy mức sàn DỰ ĐOÁN thay cho "đứng yên vì sàn chưa đi thêm". Trên 4 mốc: sai số TB **1.682 đ**, đoán đứng yên **1.750 đ**, đúng chiều 75%; lời cuối (sáng hôm sau, sàn đã đi thật) của chính các mốc đó **1.189 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 4) rồi mới kết luận.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 17 lần
- đúng chiều, non tay: 9 lần
- bỏ lỡ cú đi: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- đúng chiều, quá tay: 5 lần
- đoán cú đi không xảy ra: 5 lần
- bỏ lỡ cú đi lớn: 2 lần
- ngược chiều: 2 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 35 ngày sàn đi ≥ +0,50%): **0,51**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 473 so với 473) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 543 đ |
| 0,4 | 497 đ |
| 0,5 | 473 đ |
| 0,6 | 505 đ |
| 0,7 | 555 đ |
| 0,8 | 616 đ |

### Năm lỗi lớn nhất và lý do

- **18/11/2026** (mốc 17/11/2026), sai 1.872 đ:
  - Đúng chiều, non tay: giá đi −2.800 đ, dự đoán −928 đ.
  - Lớp truyền dẫn London đúng chiều (−928 đ), bớt được 928 đ sai số.
  - Giá trong nước chép 1,51 lần cú đi −2,32% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **03/11/2026** (mốc 02/11/2026), sai 1.654 đ:
  - Ngược chiều: giá đi −1.200 đ, dự đoán +454 đ.
  - Lớp truyền dẫn London kéo sai chiều (+492 đ), làm sai số tăng 492 đ.
  - Giá trong nước chép -1,22 lần cú đi +1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **19/11/2026** (mốc 18/11/2026), sai 1.547 đ:
  - Đúng chiều, non tay: giá đi −2.200 đ, dự đoán −653 đ.
  - Lớp truyền dẫn London đúng chiều (−653 đ), bớt được 653 đ sai số.
  - Giá trong nước chép 1,69 lần cú đi −1,69% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **17/11/2026** (mốc 16/11/2026), sai 1.158 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −842 đ.
  - Lớp truyền dẫn London đúng chiều (−842 đ), bớt được 842 đ sai số.
  - Giá trong nước chép 1,50 lần cú đi −1,63% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **16/11/2026** (mốc 14/11/2026), sai 1.075 đ:
  - Bỏ lỡ cú đi lớn: giá đi −1.000 đ, dự đoán +75 đ.
  - Lớp truyền dẫn London kéo sai chiều (+182 đ), làm sai số tăng 182 đ.
  - Mốc và ngày chấm cách nhau 2 ngày (nguồn nghỉ).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 52 | 431 đ | 692 đ | 73% | 92% |
| Lâm Đồng | 52 | 427 đ | 700 đ | 73% | 92% |
| Gia Lai | 52 | 435 đ | 692 đ | 69% | 92% |
| Đắk Nông | 52 | 445 đ | 708 đ | 71% | 92% |
| Robusta London | 49 | 39 USD | 43 USD | 55% | 96% |
| Arabica New York | 49 | 102 USD | 107 USD | 61% | 94% |

## Dự đoán sàn TRƯỚC PHIÊN (lời đầu của hai chuỗi sàn)

Bản dựng lúc bảng sàn vừa sang ngày, phiên tối nay chưa mở: chỉ có tín hiệu TradingView. Lời cuối (sáng hôm sau) lấy giá sàn đã chốt nên gần như đúng tuyệt đối — cột cuối để thấy phần chênh là thứ chỉ biết được khi phiên đã chạy.

| Chuỗi | Số mốc | Trước phiên: sai số TB | Đứng yên | Đúng chiều | Lời cuối |
|---|---|---|---|---|---|
| Robusta London | 5 | 42 USD | 48 USD | 100% | 9 USD |
| Arabica New York | 5 | 78 USD | 72 USD | 20% | 17 USD |

- Robusta London: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 5) rồi mới kết luận.
- Arabica New York: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 5) rồi mới kết luận.

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
