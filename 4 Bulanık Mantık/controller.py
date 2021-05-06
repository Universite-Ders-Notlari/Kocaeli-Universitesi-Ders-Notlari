import numpy as np
import skfuzzy as fuzz
import skfuzzy.membership as mf
import matplotlib.pyplot as plt

x_tempTest = np.arange(0, 101, 1)
x_firmTest = np.arange(0, 101, 1)
y_quality = np.arange(0, 101, 1)

temp_low = mf.trapmf(x_tempTest, [0, 0, 10, 40])
temp_med = mf.trimf(x_tempTest, [20, 50, 80])
temp_hig = mf.trapmf(x_tempTest, [60, 90, 100, 100])

firm_low = mf.trimf(x_firmTest, [0, 0, 40])
firm_med = mf.trimf(x_firmTest, [30, 50, 70])
firm_hig = mf.trimf(x_firmTest, [60, 100, 100])

#result_no = mf.trimf(y_quality, [0, 0, 100])
#result_ok = mf.trimf(y_quality, [0, 100, 100])


quality_verylow = mf.trimf(y_quality, [0, 0, 25])
quality_bitlow = mf.trimf(y_quality, [0, 25, 50])
quality_middle = mf.trimf(y_quality, [25, 50, 75])
quality_bithigh = mf.trimf(y_quality, [50, 75, 100])
quality_veryhig = mf.trimf(y_quality, [75, 100, 100])

fig, (ax0, ax1, ax2) = plt.subplots(nrows = 3, figsize = (6, 10))

ax0.plot(x_tempTest, temp_low, 'r', linewidth = 2, label = 'Düşük')
ax0.plot(x_tempTest, temp_med, 'g', linewidth = 2, label = 'Orta')
ax0.plot(x_tempTest, temp_hig, 'b', linewidth = 2, label = 'Yüksek')
ax0.set_title('Sıcaklığa Dayanıklılık')
ax0.legend()

ax1.plot(x_firmTest, firm_low, 'r', linewidth = 2, label = 'Düşük')
ax1.plot(x_firmTest, firm_med, 'g', linewidth = 2, label = 'Orta')
ax1.plot(x_firmTest, firm_hig, 'b', linewidth = 2, label = 'Yüksek')
ax1.set_title('Sağlamlık')
ax1.legend()

ax2.plot(y_quality, quality_verylow, 'r', linewidth = 2, label = 'Kalitesiz')
ax2.plot(y_quality, quality_bitlow, 'g', linewidth = 2, label = 'Az Kaliteli')
ax2.plot(y_quality, quality_middle, 'b', linewidth = 2, label = 'Orta Kaliteli')
ax2.plot(y_quality, quality_bithigh, 'y', linewidth = 2, label = 'İyi Kaliteli')
ax2.plot(y_quality, quality_veryhig, 'c', linewidth = 2, label = 'Yüksek Kaliteli')
ax2.set_title('Kalite Dereceleri')
ax2.legend()

plt.tight_layout()
plt.show()


input_temp = int(input("Sıcaklığa Dayanma Değerini giriniz:"))
input_firm = int(input("Sağlamlık değerini giriniz"))


temp_fit_low = fuzz.interp_membership(x_tempTest, temp_low, input_temp)
temp_fit_med = fuzz.interp_membership(x_tempTest, temp_med, input_temp)
temp_fit_hig = fuzz.interp_membership(x_tempTest, temp_hig, input_temp)

firm_fit_low = fuzz.interp_membership(x_firmTest, firm_low, input_firm)
firm_fit_med = fuzz.interp_membership(x_firmTest, firm_med, input_firm)
firm_fit_hig = fuzz.interp_membership(x_firmTest, firm_hig, input_firm)



rule0 = np.fmin(np.fmax(temp_fit_med, firm_fit_med), quality_middle)
rule1 = np.fmin(np.fmin(temp_fit_low, firm_fit_low), quality_verylow)
rule2 = np.fmin(np.fmin(temp_fit_low, firm_fit_med), quality_verylow)
rule3 = np.fmin(np.fmin(temp_fit_low, firm_fit_hig), quality_bitlow)
rule4 = np.fmin(np.fmin(temp_fit_med, firm_fit_low), quality_bitlow)
rule5 = np.fmin(np.fmin(temp_fit_med, firm_fit_med), quality_middle)
rule6 = np.fmin(np.fmin(temp_fit_med, firm_fit_hig), quality_bithigh)
rule7 = np.fmin(np.fmin(temp_fit_hig, firm_fit_low), quality_bithigh)
rule8 = np.fmin(np.fmin(temp_fit_hig, firm_fit_med), quality_veryhig)
rule9 = np.fmin(np.fmin(temp_fit_hig, firm_fit_hig), quality_veryhig)


out_verylow = np.fmax(rule1, rule2)
out_bitlow = np.fmax(rule3, rule4)
out_middle = np.fmax(rule0, rule5)
out_bithigh = np.fmax(rule6, rule7)
out_veryhigh = np.fmax(rule8, rule9)



#out_no = np.fmax(rule1, rule2)
#out_ok = np.fmax(rule3, rule4)

result0 = np.zeros_like(y_quality)

fig, ax3 = plt.subplots(figsize = (7, 4))
ax3.fill_between(y_quality, result0, out_verylow, facecolor = 'r', alpha = 0.7)
ax3.plot(y_quality, quality_verylow, 'r', linestyle = "--")
ax3.fill_between(y_quality, result0, out_bitlow, facecolor = 'g', alpha = 0.7)
ax3.plot(y_quality, quality_bitlow, 'g', linestyle = "--")
ax3.fill_between(y_quality, result0, out_middle, facecolor = 'g', alpha = 0.7)
ax3.plot(y_quality, quality_middle, 'b', linestyle = "--")
ax3.fill_between(y_quality, result0, out_bithigh, facecolor = 'g', alpha = 0.7)
ax3.plot(y_quality, quality_bithigh, 'm', linestyle = "--")
ax3.fill_between(y_quality, result0, out_veryhigh, facecolor = 'g', alpha = 0.7)
ax3.plot(y_quality, quality_veryhig, 'c', linestyle = "--")
ax3.set_title("Sonuç")
plt.tight_layout()

plt.show()

out_result = np.fmax(rule1,np.fmax(rule2,np.fmax(rule3,np.fmax(rule4,np.fmax(rule5,np.fmax(rule6,np.fmax(rule7,np.fmax(rule8,rule9))))))))
defuzzified = fuzz.defuzz(y_quality, out_result, 'centroid')
result = fuzz.interp_membership(y_quality, out_result, defuzzified)


print("Kalite Değeri:", defuzzified)
fig, ax4 = plt.subplots(figsize=(7, 4))



ax4.plot(y_quality, quality_verylow, 'r', linewidth = 0.5, linestyle = '--')
ax4.plot(y_quality, quality_bitlow, 'g', linewidth = 0.5, linestyle = '--')
ax4.plot(y_quality, quality_middle, 'b', linewidth = 0.5, linestyle = '--')
ax4.plot(y_quality, quality_bithigh, 'm', linewidth = 0.5, linestyle = '--')
ax4.plot(y_quality, quality_veryhig, 'c', linewidth = 0.5, linestyle = '--')
ax4.fill_between(y_quality, result0, out_result, facecolor = 'Orange', alpha = 0.7)
ax4.plot([defuzzified , defuzzified], [0, result], 'k', linewidth = 1.5, alpha = 0.9)
ax4.set_title('Ağırlık Merkezi ile Durulaştırma')
plt.tight_layout()

plt.show()
