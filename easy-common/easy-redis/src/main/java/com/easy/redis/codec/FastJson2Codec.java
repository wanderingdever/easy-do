package com.easy.redis.codec;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONReader;
import com.alibaba.fastjson2.JSONWriter;
import com.alibaba.fastjson2.filter.Filter;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufAllocator;
import io.netty.buffer.ByteBufUtil;
import io.netty.util.CharsetUtil;
import org.redisson.client.codec.BaseCodec;
import org.redisson.client.protocol.Decoder;
import org.redisson.client.protocol.Encoder;

/**
 * </p>
 *
 * @author Matt
 */
public class FastJson2Codec extends BaseCodec {

    private static final Filter autoTypeFilter = JSONReader.autoTypeFilter(
            // 按需加上需要支持自动类型的类名前缀，范围越小越安全
            "com.easy"
    );

    private final Decoder<Object> decoder = (buf, state) -> {
        byte[] bytes = new byte[buf.readableBytes()];
        buf.readBytes(bytes);
        String json = new String(bytes, CharsetUtil.UTF_8);
        // 使用 JSONReader 并配置 AutoTypeFilter
        try (JSONReader reader = JSONReader.of(json)) {
            reader.getContext().config(autoTypeFilter);
            return reader.read(Object.class);
        }
    };

    private final Encoder encoder = in -> {
        String json = JSON.toJSONString(in,
                JSONWriter.Feature.WriteClassName,  // 保留类型信息
                JSONWriter.Feature.FieldBased,
                JSONWriter.Feature.ReferenceDetection);
        ByteBuf buf = ByteBufAllocator.DEFAULT.buffer();
        try {
            ByteBufUtil.writeUtf8(buf, json);
            return buf;
        } catch (Exception e) {
            buf.release();
            throw e;
        }
    };

    @Override
    public Decoder<Object> getValueDecoder() {
        return decoder;
    }

    @Override
    public Encoder getValueEncoder() {
        return encoder;
    }
}