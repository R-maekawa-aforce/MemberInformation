package jp.co.aforce.tool;

public class ConstNum {

	public static final int male = 1;
	public static final int female = 2;

	public static final int employee = 100;
	public static final int ownBoss = 200;
	public static final int student = 300;
	public static final int other = 400;

	public static final String W_CCM0001 = "は必須入力項目です。";
	public static final String E_WKK0000 = "エラーが発生しました、やり直してください。";
	public static final String E_WKK0001 = "会員情報が既に登録されています。";
	public static final String E_WKK0002 = "会員情報の登録に失敗しました。";
	public static final String E_WKK0003 = "入力された会員番号の会員は存在しません。";
	public static final String E_WKK0004 = "会員情報の削除に失敗しました。";
	public static final String E_WKK0005 = "会員情報の取得に失敗しました。";
	public static final String I_WKK0001 = "会員情報の登録が完了しました。";
	public static final String I_WKK0002 = "会員情報の更新が完了しました。";
	public static final String I_WKK0003 = "会員情報の削除が完了しました。";
	public static final String I_WKK0004 = "会員番号は大切に保管しておいてください。";

	public static final String SQL_KK01_S01 = "SELECT COUNT(*) FROM member_info WHERE last_name = ? AND first_name = ? AND sex = ? AND  birth_year = ? AND birth_month = ? AND birth_day = ? AND job = ? AND phone_number = ? AND mail_address = ?";
	public static final String SQL_KK01_I01 = "INSERT INTO member_info VALUES(?,?,?,?,?,?,?,?,?,?)";
	public static final String SQL_KK02_S01 = "SELECT * FROM member_info WHERE member_id = ?";
	public static final String SQL_KK02_U01 = "UPDATE member_info SET last_name = ?, first_name = ?, sex = ?,  birth_year = ?, birth_month = ?, birth_day = ?, job = ?, phone_number = ?, mail_address = ? WHERE member_id = ?";
	public static final String SQL_KK03_D01 = "DELETE FROM member_info WHERE member_id = ?";
			}
