xml.instruct!

xml.rss "version" => "2.0" do
 xml.channel do
    xml.title "QnA Forum Questions"
    xml.description "We come togerther to help the ones in need"
    xml.link questions_url(:rss)

    for question in @questions
      xml.item do
        xml.title question.header
        xml.description question.question
        xml.pubDate question.created_at.to_s(:rfc822)
        xml.link question_url(question, :rss)
        xml.guid question_url(question, :rss)
      end
    end
  end
end